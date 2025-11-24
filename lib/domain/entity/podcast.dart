import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';

part 'podcast.freezed.dart';

@freezed
class PodcastInput with _$PodcastInput {
  const factory PodcastInput({
    required List<LmsTask> lmsTasks,
    required CampusSquareCalendarDay campusSquareCalendarDay,
  }) = _PodcastInput;
}
