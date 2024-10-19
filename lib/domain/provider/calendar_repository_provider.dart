import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/repository/calendar_repository_impl.dart';
import 'package:uaizu_app/infrastructure/data_source/campus_square_calendar_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/library_calendar_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/lms_calendar_data_source.dart';

import 'client_provider.dart';

final _campusSquareCalendarDataSourceProvider = Provider((ref) {
  return CampusSquareCalendarDataSource(ref.watch(campusSquareClientProvider));
});

final _libraryCalendarDataSourceProvider = Provider((ref) {
  return LibraryCalendarDataSource(ref.watch(libraryClientProvider));
});

final _lmsCalendarDataSourceProvider = Provider((ref) {
  return LmsCalendarDataSource(ref.watch(lmsClientProvider));
});

final calendarRepositoryProvider = Provider((ref) {
  return CalendarRepositoryImpl(
    ref.watch(_libraryCalendarDataSourceProvider),
    ref.watch(_campusSquareCalendarDataSourceProvider),
    ref.watch(_lmsCalendarDataSourceProvider),
  );
});
