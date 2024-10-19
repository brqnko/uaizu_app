import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/repository/grade_repository_impl.dart';
import 'package:uaizu_app/infrastructure/data_source/grade_data_source.dart';

import 'client_provider.dart';

final _gradeDataSourceProvider = Provider((ref) {
  return GradeDataSource(ref.watch(campusSquareClientProvider));
});

final gradeRepositoryProvider = Provider((ref) {
  return GradeRepositoryImpl(ref.watch(_gradeDataSourceProvider));
});
