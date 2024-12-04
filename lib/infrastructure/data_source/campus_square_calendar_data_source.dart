import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/duration_range.dart';
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

    return _parseCalendarDayFromBody(res.body, date);
  }

  CampusSquareCalendarDay _parseCalendarDayFromBody(
    String body,
    DateTime date,
  ) {
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
    DurationRange? range;
    if (split.length == 3 &&
        (range = _fromMatchToDateTimeRange(split[0])) != null) {
      return CampusSquareCalendarLecture(
        startTime: date.add(range!.start),
        endTime: date.add(range.end),
        courseName: split[2],
        timeSlot: split[0],
        location: split[1],
        type: CampusSquareCalendarLectureType.values
            .firstWhere((type) => classes.contains(type.className)),
        locale: _client.locale,
      );
    } else {
      debugPrint('Failed to parse lecture: $content');
      return null;
    }
  }

  final _durationRangeMap = {
    1: const DurationRange(
      start: Duration(hours: 9),
      end: Duration(hours: 9, minutes: 50),
    ),
    2: const DurationRange(
      start: Duration(hours: 9, minutes: 50),
      end: Duration(hours: 10, minutes: 40),
    ),
    3: const DurationRange(
      start: Duration(hours: 10, minutes: 50),
      end: Duration(hours: 11, minutes: 40),
    ),
    4: const DurationRange(
      start: Duration(hours: 11, minutes: 40),
      end: Duration(hours: 12, minutes: 30),
    ),
    5: const DurationRange(
      start: Duration(hours: 13, minutes: 20),
      end: Duration(hours: 14, minutes: 10),
    ),
    6: const DurationRange(
      start: Duration(hours: 14, minutes: 10),
      end: Duration(hours: 15),
    ),
    7: const DurationRange(
      start: Duration(hours: 15, minutes: 10),
      end: Duration(hours: 16),
    ),
    8: const DurationRange(
      start: Duration(hours: 16),
      end: Duration(hours: 16, minutes: 50),
    ),
    9: const DurationRange(
      start: Duration(hours: 17),
      end: Duration(hours: 17, minutes: 50),
    ),
    10: const DurationRange(
      start: Duration(hours: 17, minutes: 50),
      end: Duration(hours: 18, minutes: 40),
    ),
    11: const DurationRange(
      start: Duration(hours: 18, minutes: 50),
      end: Duration(hours: 19, minutes: 40),
    ),
  };

  final _timeSlotRegExp = RegExp(r'\d+');

  DurationRange? _fromMatchToDateTimeRange(String content) {
    final matches = _timeSlotRegExp
        .allMatches(content)
        .map((match) => int.parse(match.group(0)!))
        .toList();

    if (matches.length == 2) {
      return DurationRange(
        start: _durationRangeMap[matches[0]]!.start,
        end: _durationRangeMap[matches[1]]!.end,
      );
    } else {
      debugPrint('Failed to parse time slot: $content');
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
