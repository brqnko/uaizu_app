import 'package:uaizu_app/domain/entity/registration.dart';

abstract class RegistrationRepository {
  Future<List<Registration>> fetchRegistration(SearchRegistrationQuery query);
}
