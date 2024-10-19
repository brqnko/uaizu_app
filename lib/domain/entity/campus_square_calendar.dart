import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/settings.dart';

part 'campus_square_calendar.freezed.dart';

enum CampusSquareCalendarLectureType {
  kaiko,
  kyuko,
  hoko,
}

@freezed
class CampusSquareCalendarLecture with _$CampusSquareCalendarLecture {
  const factory CampusSquareCalendarLecture({
    required DateTime day,
    required String courseName,
    required String timeSlot,
    required String location,
    required CampusSquareCalendarLectureType type,
    required AppLocale locale,
  }) = _CampusSquareCalendarLecture;
}

@freezed
class CampusSquareCalendarDay with _$CampusSquareCalendarDay {
  const factory CampusSquareCalendarDay({
    required DateTime day,
    required List<String> notes,
    required List<CampusSquareCalendarLecture> lectures,
    required AppLocale locale,
  }) = _CampusSquareCalendarDay;
}

@freezed
class CampusSquareCalendarEntire with _$CampusSquareCalendarEntire {
  const factory CampusSquareCalendarEntire({
    required Map<DateTime, CampusSquareCalendarDay> calenderMonth,
    required AppLocale locale,
  }) = _CampusSquareCalendarEntire;
}
