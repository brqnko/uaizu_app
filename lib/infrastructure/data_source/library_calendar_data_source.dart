import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/infrastructure/client/library_client.dart';

const _authority = 'libopsv.u-aizu.ac.jp';

final _colorRegex = RegExp(r'background-color:\s*#([0-9A-Fa-f]{6})');

class LibraryCalendarDataSource {
  LibraryCalendarDataSource(
    this._client,
  );

  final LibraryClient _client;

  Future<LibraryCalendarMonth> fetchCalendar(LibraryCalenderQuery query) async {
    // Convert the boolean to an index
    final index = query.isFourYear ? 2 : 1;

    final response = await _client.get(
      Uri.https(
        _authority,
        '/drupal/${_client.locale.name}/library_calendar/calendar/$index/${query.time.year}/${query.time.month}',
      ),
    );

    return parseOpeningCalendarFromBody(response.body, query.time);
  }

  bool _isInteger(String value) {
    return int.tryParse(value) != null;
  }

  MapEntry<DateTime, LibraryOpeningState> _parseOpeningStateFromElement(
    Element element,
    DateTime month,
  ) {
    final day = month.copyWith(day: int.parse(element.text));
    final openingState = element.attributes['title'];
    final colorHex = int.parse(
      'FF${_colorRegex.firstMatch(element.attributes['style']!)?.group(1)}',
      radix: 16,
    );

    return MapEntry(
      day,
      LibraryOpeningState(
        day: day,
        colorHex: colorHex,
        text: openingState,
        locale: _client.locale,
      ),
    );
  }

  bool _isOpeningStateElement(Element element) {
    return _isInteger(element.text);
  }

  Map<int, String> _calenderToOpeningColors(
    Map<DateTime, LibraryOpeningState> calendar,
  ) {
    final calenderOpeningColors = <int, String>{};
    calendar.forEach((_, openingState) {
      calenderOpeningColors[openingState.colorHex] = openingState.text!;
    });

    return calenderOpeningColors;
  }

  LibraryCalendarMonth parseOpeningCalendarFromBody(
    String responseBody,
    DateTime time,
  ) {
    final document = parse(responseBody);

    final calenderList = document
        .querySelector('table.library_calendar_table[data-striping="1"]')!
        .querySelectorAll('tr')
        .expand((element) => element.querySelectorAll('td'))
        .where(_isOpeningStateElement)
        .map((element) => _parseOpeningStateFromElement(element, time))
        .toList();

    final calender = Map.fromEntries(calenderList);

    return LibraryCalendarMonth(
      month: time,
      calender: calender,
      calenderColors: _calenderToOpeningColors(calender),
      locale: _client.locale,
    );
  }
}
