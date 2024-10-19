import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/repository/registration_repository_impl.dart';
import 'package:uaizu_app/infrastructure/data_source/registration_data_source.dart';

import 'client_provider.dart';

final _registrationDataSourceProvider = Provider((ref) {
  return RegistrationDataSource(ref.watch(campusSquareClientProvider));
});

final registrationRepositoryProvider = Provider((ref) {
  return RegistrationRepositoryImpl(ref.watch(_registrationDataSourceProvider));
});
