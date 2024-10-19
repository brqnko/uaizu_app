import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/usecase/campus_square_usecase.dart';

final campusSquareCalendarFocusedDayProvider = StateProvider(
  (ref) => DateTime.now(),
);

final campusSquareCalendarDayScheduleProvider = FutureProvider((ref) {
  final date = ref.watch(campusSquareCalendarFocusedDayProvider);

  return ref.watch(getCampusSquareCalenderDayUseCacseProvider).call(
        GetCampusSquareCalenderDayUseCaseParam(
          date: date,
          useCache: true,
        ),
      );
});
