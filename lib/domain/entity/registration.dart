import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.freezed.dart';

@freezed
class Registration with _$Registration {
  const factory Registration({
    required String title,
    required String? timeSlots,
    required String? referenceUrl,
    required List<String> info,
  }) = _Registration;
}

@freezed
class SearchRegistrationQuery with _$SearchRegistrationQuery {
  const factory SearchRegistrationQuery({
    required int year,
    required bool semester,
  }) = _SearchRegistrationQuery;
}
