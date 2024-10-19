import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
class AccountInfo with _$AccountInfo {
  const factory AccountInfo({
    required String studentId,
    required String password,
  }) = _AccountInfo;
}

enum AppTheme {
  dark,
  light;
}

enum AppLocale {
  ja('ja', '日本語'),
  en('en', 'English');

  const AppLocale(
    this.languageCode,
    this.title,
  );

  final String languageCode;
  final String title;
}

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required AccountInfo accountInfo,
    required bool hideStudentId,
    required AppTheme appTheme,
    required AppLocale appLocale,
  }) = _AppSettings;
}
