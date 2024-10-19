import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/usecase/library_usecase.dart';

final libraryCalendarMonthProvider = StateProvider((ref) {
  return DateTime.now();
});

final libraryCalendarIsFourYearProvider = StateProvider((ref) => true);

final libraryCalendarProvider =
    AsyncNotifierProvider<LibraryCalendarNotifier, LibraryCalendarEntire>(() {
  return LibraryCalendarNotifier();
});

class LibraryCalendarNotifier extends AsyncNotifier<LibraryCalendarEntire> {
  @override
  FutureOr<LibraryCalendarEntire> build() {
    return ref.watch(getLibraryCalendarUseCaseProvider).call(
          GetLibraryCalenderUseCaseParam(
            query: LibraryCalenderQuery(
              time: ref.watch(libraryCalendarMonthProvider),
              isFourYear: ref.watch(libraryCalendarIsFourYearProvider),
            ),
          ),
        );
  }

  Future<void> requestUpdate() {
    return update(
      (prev) => ref.watch(getLibraryCalendarUseCaseProvider).call(
            GetLibraryCalenderUseCaseParam(
              query: LibraryCalenderQuery(
                time: ref.watch(libraryCalendarMonthProvider),
                isFourYear: ref.watch(libraryCalendarIsFourYearProvider),
              ),
            ),
          ),
    );
  }
}
