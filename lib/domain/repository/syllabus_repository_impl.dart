import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/domain/repository/syllabus_repository.dart';
import 'package:uaizu_app/infrastructure/data_source/syllabus_data_source.dart';

class SyllabusRepositoryImpl implements SyllabusRepository {
  SyllabusRepositoryImpl(this._dataSource);

  final SyllabusDataSource _dataSource;

  @override
  Future<List<SyllabusLecture>> fetchLectures(
    SyllabusLectureSearchQuery query,
  ) {
    return _dataSource.fetchSyllabus(query);
  }
}
