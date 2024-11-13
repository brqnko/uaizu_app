import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/use_case/lms_usecase.dart';

final lmsCalendarFocusedDaProvider = StateProvider((ref) => DateTime.now());

final lmsCalendarTaskDayProvider = FutureProvider((ref) {
  return ref.watch(getLmsTaskDayUseCaseProvider).call(
        LmsTaskDayUseCaseParam(
          date: ref.watch(lmsCalendarFocusedDaProvider),
        ),
      );
});
