import 'package:uaizu_app/domain/entity/grade.dart';

abstract class GradeRepository {
  Future<Grade> fetchGrade(GradeQuery query);
}
