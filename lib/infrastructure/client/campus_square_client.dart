import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';

const _authority = 'csweb.u-aizu.ac.jp';
const _portalPath = 'campusweb/campusportal.do';
const _squarePath = 'campusweb/campussquare.do';

class CampusSquareClient {
  CampusSquareClient(
    this._client,
    this._studentId,
    this._password,
    this._locale, [
    this._rwfHash,
  ]) : _lastLoginTime = DateTime.now();

  final AppHttpClient _client;
  final String _studentId;
  final String _password;
  final AppLocale _locale;
  String? _rwfHash;
  DateTime _lastLoginTime;

  Future<Response> get(
    Map<String, String> param, {
    bool square = false,
  }) =>
      _client.get(
        Uri.https(
          _authority,
          square ? _squarePath : _portalPath,
          param,
        ),
      );

  Future<Response> post(Map<String, dynamic> param) => _client.post(
        Uri.https(
          _authority,
          _portalPath,
          param,
        ),
      );

  Future<String> requireRwfHash() async {
    if (DateTime.now().difference(_lastLoginTime).inMinutes >= 29) {
      _rwfHash = null;
      debugPrint('logged in campus square again');
    }

    if (_rwfHash != null) {
      return _rwfHash!;
    }

    await _updateRwfHash();
    return _rwfHash!;
  }

  Future<void> _updateRwfHash() async {
    debugPrint('try logging in campus square');

    if (_studentId.isEmpty || _password.isEmpty) {
      throw Exception('Student Id or password is empty');
    }

    debugPrint('logging in campus square for real');
    final rwfHash = _extractRwfHash((await post({})).body);

    final body = (await get({
      'wfId': 'nwf_PTW0000002_login',
      'userName': _studentId,
      'password': _password,
      'locale': _locale.campusSquareLocale,
      'undefined': '',
      'action': 'rwf',
      'tabId': 'home',
      'page': 'main',
      'rwfHash': rwfHash,
    }))
        .body;

    if (!body.contains('now loading...')) {
      throw Exception('Invalid username or password');
    }

    _rwfHash = _extractRwfHash((await get({'page': 'main'})).body);
    _lastLoginTime = DateTime.now();
  }

  /// Extract the RWF hash from the raw HTML
  String _extractRwfHash(String html) {
    final clipped = clip(html, 'var portalConf = ', ';').replaceAll("'", '"');
    final json = jsonDecode(clipped) as Map<String, dynamic>;

    final rwfHash = json['rwfHash'];
    if (rwfHash == null || rwfHash is! String) {
      throw Exception('Failed to extract RWF hash');
    }

    return rwfHash;
  }

  /// Extracts a substring from a target string based on two marker strings
  ///
  /// [target] The target string from which to extract the substring
  /// [first] The first marker string to delimit the start of the substring
  /// [last] The second marker string to delimit the end of the substring
  String clip(String target, String first, String last) {
    final startIndex = target.indexOf(first) + first.length;
    return target.substring(startIndex, target.indexOf(last, startIndex));
  }

  CampusSquareClient copyWith({
    String? studentId,
    String? password,
    AppLocale? locale,
  }) =>
      CampusSquareClient(
        _client,
        studentId ?? _studentId,
        password ?? _password,
        locale ?? _locale,
        _rwfHash,
      );

  AppLocale get locale => _locale;
}

String? parseExecutionKeyFromDocument(Document document) {
  return document
      .querySelector('input[name="_flowExecutionKey"]')
      ?.attributes['value'];
}

extension on AppLocale {
  String get campusSquareLocale {
    switch (this) {
      case AppLocale.ja:
        return 'ja_JP';
      case AppLocale.en:
        return 'en_US';
    }
  }
}
