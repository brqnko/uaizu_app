import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/settings.dart';

part 'grade.freezed.dart';

@freezed
class ToeicScore with _$ToeicScore {
  const factory ToeicScore({
    required DateTime date,
    required String type,
    required int score,
    required int reqdingScore,
    required int listeningScore,
  }) = _ToeicScore;
}

@freezed
class SubjectGrade with _$SubjectGrade {
  const factory SubjectGrade({
    required int year,
    required String semester,
    required String code,
    required String subjectTitle,
    required String teacher,
    required String score, // 履修中になるかもしれない
    required String grade,
    required String result,
    required AppLocale locale,
  }) = _SubjectGrade;
}

@freezed
class Grade with _$Grade {
  const factory Grade({
    required String studentId,
    required String studentName,
    required String department,
    required String year,
    required String semester,
    required ToeicScore? bestToeicScore,
    required List<ToeicScore> toeicScores,
    required List<SubjectGrade> subjectGrades,
    required AppLocale locale,
  }) = _Grade;
}

@freezed
class GradeQuery with _$GradeQuery {
  const factory GradeQuery({
    required bool showAll,
    required int? year,
    required int? quarter,
  }) = _GradeQuery;
}
