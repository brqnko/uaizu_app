import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/domain/repository/registration_repository.dart';
import 'package:uaizu_app/infrastructure/data_source/registration_data_source.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl(this._dataSource);

  final RegistrationDataSource _dataSource;

  @override
  Future<List<Registration>> fetchRegistration(SearchRegistrationQuery query) {
    return _dataSource.fetchRegistrations(query);
  }
}
