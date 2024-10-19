import 'package:http/http.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';

class LibraryClient {
  LibraryClient(
    this._client,
    this._locale,
  );

  final AppHttpClient _client;
  final AppLocale _locale;

  LibraryClient copyWith({
    String? studentId,
    String? password,
    AppLocale? locale,
  }) =>
      LibraryClient(
        _client,
        locale ?? _locale,
      );

  Future<Response> get(Uri uri) => _client.get(uri);

  AppLocale get locale => _locale;
}

extension LibraryLocale on AppLocale {
  String get libraryLocale {
    switch (this) {
      case AppLocale.ja:
        return 'ja';
      case AppLocale.en:
        return 'en';
    }
  }
}
