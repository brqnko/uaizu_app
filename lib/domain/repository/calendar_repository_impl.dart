import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/domain/repository/calendar_repository.dart';
import 'package:uaizu_app/infrastructure/data_source/campus_square_calendar_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/library_calendar_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/lms_calendar_data_source.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl(
    this._libraryCalendarDataSource,
    this._campusSquareCalendarDataSource,
    this._lmsCalendarDataSource,
  );

  final LibraryCalendarDataSource _libraryCalendarDataSource;
  final CampusSquareCalendarDataSource _campusSquareCalendarDataSource;
  final LmsCalendarDataSource _lmsCalendarDataSource;

  @override
  Future<LibraryCalendarMonth> fetchLibraryCalendarMonth(
    LibraryCalenderQuery query,
  ) {
    return _libraryCalendarDataSource.fetchCalendar(query);
  }

  @override
  Future<CampusSquareCalendarDay> fetchCampusSquareCalendarDay(DateTime date) {
    return _campusSquareCalendarDataSource.fetchCalendarDay(date);
  }

  @override
  Future<List<LmsTask>> fetchLmsTaskDay(DateTime date) {
    return _lmsCalendarDataSource.fetchLmsTaskDay(date);
  }
}
