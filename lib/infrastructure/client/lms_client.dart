import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';

final _loginUri = Uri.parse('https://elms.u-aizu.ac.jp/login/index.php');

class LmsClient {
  LmsClient(
    this._client,
    this._locale,
    this._studentId,
    this._password, [
    this._loginToken,
  ]);

  final AppHttpClient _client;
  final AppLocale _locale;
  final String _studentId;
  final String _password;

  String? _loginToken;

  Future<Response> get(Uri uri) => _client.get(uri);

  Future<String> requireLoginToken() async {
    if (_loginToken != null) {
      return _loginToken!;
    }

    await _updateLoginTOken();
    return _loginToken!;
  }

  Future<void> _updateLoginTOken() async {
    if (_studentId.isEmpty || _password.isEmpty) {
      throw Exception('Student Id or password is empty');
    }

    final loginToken = _extractLoginToken(
      await _client.get(_loginUri),
    );
    if (loginToken == null) {
      throw Exception('Failed to extract login token');
    }

    // HACK
    final request = Request('POST', _loginUri)
      ..followRedirects = false
      ..headers[HttpHeaders.contentTypeHeader] =
          'application/x-www-form-urlencoded'
      ..headers[HttpHeaders.cookieHeader] = _client.coookies.entries
          .map((entry) => '${entry.key}=${entry.value}')
          .toList()
          .join('; ')
      ..bodyFields = {
        'logintoken': loginToken,
        'username': _studentId,
        'password': _password,
      };
    final streamedResponse = await request.send();
    _client.parseCookies(streamedResponse);
    var response = await Response.fromStream(streamedResponse);
    if (response.statusCode != 303) {
      throw Exception(
        'Failed to log in to moodle(maybe wrong username or password?)',
      );
    }

    // redirect
    while (response.statusCode == 303) {
      final redirectUrl = _extractRedirectUrlFromBody(response.body);
      if (redirectUrl == null) {
        throw Exception('failed to extract redirect url');
      }

      response = await _client.get(Uri.parse(redirectUrl));
    }

    _loginToken = loginToken;
  }

  String? _extractRedirectUrlFromBody(String body) {
    return parse(body).querySelector('a')?.attributes['href'];
  }

  String? _extractLoginToken(Response res) {
    return parse(res.body)
        .querySelector('input[name="logintoken"]')
        ?.attributes['value'];
  }

  Future<void> _logout() async {
    await _client.get(
      Uri.parse(
        'https://elms.u-aizu.ac.jp/login/logout.php?sesskey=beKUjwPsPU',
      ),
    );
  }

  LmsClient copyWith({
    String? studentId,
    String? password,
    AppLocale? locale,
  }) {
    _logout();

    return LmsClient(
      _client,
      locale ?? _locale,
      studentId ?? _studentId,
      password ?? _password,
      _loginToken,
    );
  }

  AppLocale get locale => _locale;
}
