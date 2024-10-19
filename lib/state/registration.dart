import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/usecase/campus_square_usecase.dart';

final registrationSearchResultProvider =
    AsyncNotifierProvider<RegistrationSearchResultNotifier, List<Registration>>(
        () {
  return RegistrationSearchResultNotifier();
});

final registrationYearProvider = StateProvider((ref) => DateTime.now().year);

final registrationSemesterProvider = StateProvider((ref) => false);

class RegistrationSearchResultNotifier
    extends AsyncNotifier<List<Registration>> {
  @override
  FutureOr<List<Registration>> build() {
    return [];
  }

  Future<void> requestUpdateSearchResult() {
    return update((prev) {
      return ref.watch(getRegistrationUseCaseProvider).call(
            GetRegistrationUseCaseParam(
              query: SearchRegistrationQuery(
                year: ref.watch(registrationYearProvider),
                semester: ref.watch(registrationSemesterProvider),
              ),
              useCache: false,
            ),
          );
    });
  }
}
