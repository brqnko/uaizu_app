import 'package:uaizu_app/domain/entity/syllabus.dart';

abstract class SyllabusRepository {
  Future<List<SyllabusLecture>> fetchLectures(SyllabusLectureSearchQuery query);
}
