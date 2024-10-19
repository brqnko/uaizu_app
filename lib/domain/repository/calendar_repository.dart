import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';

abstract class CalendarRepository {
  Future<CampusSquareCalendarDay> fetchCampusSquareCalendarDay(DateTime date);

  Future<LibraryCalendarMonth> fetchLibraryCalendarMonth(
    LibraryCalenderQuery query,
  );

  Future<List<LmsTask>> fetchLmsTaskDay(DateTime date);
}
