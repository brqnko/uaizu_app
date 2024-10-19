import 'package:freezed_annotation/freezed_annotation.dart';

part 'lms_calendar.freezed.dart';

@freezed
class LmsTask with _$LmsTask {
  const factory LmsTask({
    required DateTime date,
    required String title,
    required String? courseLink,
    required String? activityLink,
  }) = _LmsTask;
}
