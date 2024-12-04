import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_range.freezed.dart';

@freezed
class DurationRange with _$DurationRange {
  const factory DurationRange({
    required Duration start,
    required Duration end,
  }) = _DurationRange;
}
