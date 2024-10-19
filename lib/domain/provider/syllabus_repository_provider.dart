import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/repository/syllabus_repository_impl.dart';
import 'package:uaizu_app/infrastructure/data_source/syllabus_data_source.dart';

import 'client_provider.dart';

final _syllabusDataSourceProvider = Provider((ref) {
  return SyllabusDataSource(ref.watch(campusSquareClientProvider));
});

final syllabusRepositoryProvider = Provider((ref) {
  return SyllabusRepositoryImpl(ref.watch(_syllabusDataSourceProvider));
});
