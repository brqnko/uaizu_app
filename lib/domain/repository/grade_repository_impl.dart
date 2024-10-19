import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/domain/repository/grade_repository.dart';
import 'package:uaizu_app/infrastructure/data_source/grade_data_source.dart';

class GradeRepositoryImpl implements GradeRepository {
  GradeRepositoryImpl(this._dataSource);

  final GradeDataSource _dataSource;

  @override
  Future<Grade> fetchGrade(GradeQuery query) {
    return _dataSource.fetchGrade(query);
  }
}
