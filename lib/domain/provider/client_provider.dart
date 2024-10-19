import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';
import 'package:uaizu_app/infrastructure/client/campus_square_client.dart';
import 'package:uaizu_app/infrastructure/client/library_client.dart';
import 'package:uaizu_app/infrastructure/client/lms_client.dart';
import 'package:uaizu_app/state/settings.dart';

final appClientProvider = Provider((ref) {
  ref.watch(settingsProvider.select((settings) => settings.appLocale));

  return AppHttpClient(Client());
});

final campusSquareClientProvider = Provider((ref) {
  final settings = ref.watch(settingsProvider);

  return CampusSquareClient(
    ref.watch(appClientProvider),
    settings.accountInfo.studentId,
    settings.accountInfo.password,
    settings.appLocale,
  );
});

final libraryClientProvider = Provider((ref) {
  final appLocale = ref.watch(
    settingsProvider.select((settings) => settings.appLocale),
  );

  return LibraryClient(
    ref.read(appClientProvider),
    appLocale,
  );
});

final lmsClientProvider = Provider((ref) {
  final settings = ref.watch(settingsProvider);

  return LmsClient(
    ref.read(appClientProvider),
    settings.appLocale,
    settings.accountInfo.studentId,
    settings.accountInfo.password,
  );
});
