import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/infrastructure/client/campus_square_client.dart';

class SyllabusDataSource {
  SyllabusDataSource(this._client);

  final CampusSquareClient _client;

  Future<List<SyllabusLecture>> fetchSyllabus(
    SyllabusLectureSearchQuery query,
  ) async {
    await _client.requireRwfHash();

    final flowExecutionKeyRes = await _client.get(
      {
        '_flowId': 'SYW0001000-flow',
      },
      square: true,
    );
    final flowExecutionKey = parseExecutionKeyFromDocument(
      parse(flowExecutionKeyRes.body),
    );
    if (flowExecutionKey == null) {
      throw Exception('Failed to parse execution key');
    }

    final res = await _client.get(
      {
        's_no': '0',
        '_flowExecutionKey': flowExecutionKey,
        '_eventId': 'search',
        'nendo': query.year.toString(),
        'jikanwariShozokuCode': '51',
        'gakkiKubunCode': '',
        'kaikoKubunCode': '',
        'kyokannm': '',
        'kaikoKamokunm': '',
        'nenji': '',
        'yobi': '',
        'jigen': '',
        'freeWord': query.freeWord,
        '_displayCount': query.displayCount.toString(),
      },
      square: true,
    );

    if (res.statusCode != 200) {
      throw Exception('fetch registration: status code != 200');
    }

    return parseRegistrationFromBody(res.body);
  }

  List<SyllabusLecture> parseRegistrationFromBody(String body) {
    final document = parse(body);

    return document
        .querySelectorAll('tbody tr')
        .map((row) {
          final cells = row.querySelectorAll('td');
          if (cells.length >= 7) {
            return SyllabusLecture(
              name: cells[5].text.trim(),
              semester: cells[1].text.trim(),
              quarter: cells[2].text.trim(),
              timeSlot: cells[3].text.replaceAll(' ', '').replaceAll('\n', ''),
              code: int.parse(cells[4].text.trim()),
              instructor: cells[6].text.trim(),
              appLocale: _client.locale,
            );
          } else {
            return null;
          }
        })
        .whereType<SyllabusLecture>()
        .toList();
  }
}
