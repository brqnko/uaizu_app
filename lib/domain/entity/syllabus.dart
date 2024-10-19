import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/settings.dart';

part 'syllabus.freezed.dart';

@freezed
class SyllabusLecture with _$SyllabusLecture {
  const factory SyllabusLecture({
    required String name,
    required String semester,
    required String quarter,
    required String timeSlot,
    required int code,
    required String instructor,
    required AppLocale appLocale,
  }) = _SyllabusLecture;
}

@freezed
class SyllabusLectureSearchQuery with _$SyllabusLectureSearchQuery {
  const factory SyllabusLectureSearchQuery({
    required int year,
    required int displayCount,
    required String freeWord,
    //
  }) = _SyllabusLectureSearchQuery;
}
