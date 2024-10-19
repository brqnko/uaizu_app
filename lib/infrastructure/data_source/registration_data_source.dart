import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/infrastructure/client/campus_square_client.dart';

class RegistrationDataSource {
  RegistrationDataSource(this._client);

  final CampusSquareClient _client;

  Future<List<Registration>> fetchRegistrations(
    SearchRegistrationQuery query,
  ) async {
    await _client.requireRwfHash();

    final flowExecutionKeyRes = await _client.get(
      {
        '_flowId': 'JPW0001000-flow',
      },
      square: true,
    );
    final flowExecutionKey = parseExecutionKeyFromDocument(
      parse(flowExecutionKeyRes.body),
    );
    if (flowExecutionKey == null) {
      throw Exception('failed to fetch flowExecutionKey');
    }

    final res = await _client.get(
      {
        '_eventId': 'changeNendoGakkiGakusei',
        '_flowExecutionKey': flowExecutionKey,
        'nendo': query.year.toString(),
        'gakkiKbnCd': query.semester ? '1' : '2',
      },
      square: true,
    );

    return parseRegistrationFromBody(res.body);
  }

  List<Registration> parseRegistrationFromBody(String body) => parse(body)
      .querySelectorAll('tr')
      .map(
        (row) {
          final linkElement = row.querySelector('td a');
          if (linkElement == null) {
            return null;
          }

          final info = row
              .querySelectorAll('td.menu a')
              .map((menu) => menu.attributes['title'])
              .whereType<String>()
              .toList();

          return Registration(
            title: linkElement.text,
            timeSlots: row.querySelector('td:last-child')?.text,
            referenceUrl: linkElement.attributes['href'],
            info: info,
          );
        },
      )
      .whereType<Registration>()
      .toList();
}
