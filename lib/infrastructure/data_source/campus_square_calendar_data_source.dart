import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/infrastructure/client/campus_square_client.dart';

class CampusSquareCalendarDataSource {
  CampusSquareCalendarDataSource(this._client);

  final CampusSquareClient _client;

  Future<CampusSquareCalendarDay> fetchCalendarDay(DateTime date) async {
    final rwfHash = await _client.requireRwfHash();

    final res = await _client.get(
      {
        'wfId': 'wf_PTW0005100-s_20120920145137',
        'event': 'findMyscheduleList',
        'calendarYear': date.year.toString(),
        'calendarMonth': date.month.toString(),
        'selectedDate':
            '${date.year}_${date.month}_${date.day}_Thu_wf_PTW0005100-s_20120920145137',
        'action': 'rwf',
        'tabId': 'home',
        'page': 'main',
        'rwfHash': rwfHash,
      },
    );

    print(res.body);

    return _parseCalendarDayFromBody(res.body, date);
  }

  CampusSquareCalendarDay _parseCalendarDayFromBody(
      String body, DateTime date,) {
    final document = parse(body);
    final items = document.querySelectorAll('.mysch-portlet-list li');
    final notes = <String>[];
    final lectures = <CampusSquareCalendarLecture>[];

    for (final item in items) {
      if (CampusSquareCalendarLectureType.values
          .any((type) => item.classes.contains(type.className))) {
        final lecture = _tryParseAsLecture(
          item.text
              .replaceAll('  ', '')
              .replaceAll('\n', '')
              .replaceAll('：', ':'),
          item.classes,
          date,
        );
        if (lecture != null) {
          lectures.add(lecture);
        } else {
          // debugPrint(item.text);
        }
      } else {
        notes.add(
          item.text
              .replaceAll('  ', '')
              .replaceAll('\n', '')
              .replaceAll('：', ':'),
        );
      }
    }

    return CampusSquareCalendarDay(
      day: date,
      notes: notes,
      lectures: lectures,
      locale: _client.locale,
    );
  }

  CampusSquareCalendarLecture? _tryParseAsLecture(
    String content,
    CssClassSet classes,
    DateTime date,
  ) {
    final split = content.split(':');
    if (split.length == 3) {
      return CampusSquareCalendarLecture(
        day: date,
        courseName: split[2],
        timeSlot: split[0],
        location: split[1],
        type: CampusSquareCalendarLectureType.values
            .firstWhere((type) => classes.contains(type.className)),
        locale: _client.locale,
      );
    } else {
      return null;
    }
  }
}

extension on CampusSquareCalendarLectureType {
  String get className {
    switch (this) {
      case CampusSquareCalendarLectureType.hoko:
        return 'hoko';
      case CampusSquareCalendarLectureType.kaiko:
        return 'kaiko';
      case CampusSquareCalendarLectureType.kyuko:
        return 'kyuuko';
    }
  }
}
