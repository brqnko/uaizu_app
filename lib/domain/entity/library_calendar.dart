import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/settings.dart';

part 'library_calendar.freezed.dart';

@freezed
class LibraryOpeningState with _$LibraryOpeningState {
  const factory LibraryOpeningState({
    required DateTime day,
    required int colorHex,
    required String? text,
    required AppLocale locale,
  }) = _LibraryOpeningState;
}

@freezed
class LibraryCalendarMonth with _$LibraryCalendarMonth {
  const factory LibraryCalendarMonth({
    required DateTime month,
    required Map<DateTime, LibraryOpeningState> calender,
    required Map<int, String> calenderColors,
    required AppLocale locale,
  }) = _LibraryCalendarMonth;
}

@freezed
class LibraryCalendarEntire with _$LibraryCalendarEntire {
  const factory LibraryCalendarEntire({
    required Map<DateTime, LibraryCalendarMonth> calender,
  }) = _LibraryCalendarEntire;
}

@freezed
class LibraryCalenderQuery with _$LibraryCalenderQuery {
  const factory LibraryCalenderQuery({
    required DateTime time,
    required bool isFourYear,
  }) = _LibraryCalenderQuery;
}
