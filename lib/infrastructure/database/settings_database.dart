import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uaizu_app/domain/entity/settings.dart';

class SettingsDatabase {
  SettingsDatabase(this._storage);

  final FlutterSecureStorage _storage;

  Future<AppSettings> loadSettings() async {
    final studentId = await _storage.read(key: 'studentId');
    final password = await _storage.read(key: 'password');
    final hideStudentId = await _storage.read(key: 'hideStudentId');
    final appTheme = await _storage.read(key: 'appTheme');
    final appLocale = await _storage.read(key: 'appLocale');

    return AppSettings(
      accountInfo: AccountInfo(
        studentId: studentId ?? '',
        password: password ?? '',
      ),
      hideStudentId: hideStudentId == 'true',
      appTheme: AppTheme.values.firstWhere(
        (e) => e.toString() == appTheme,
        orElse: () => AppTheme.light,
      ),
      appLocale: AppLocale.values.firstWhere(
        (e) => e.toString() == appLocale,
        orElse: () => AppLocale.en,
      ),
    );
  }

  Future<void> saveSettings(AppSettings settings) async {
    await _storage.write(
      key: 'studentId',
      value: settings.accountInfo.studentId,
    );
    await _storage.write(key: 'password', value: settings.accountInfo.password);
    await _storage.write(
      key: 'hideStudentId',
      value: settings.hideStudentId.toString(),
    );
    await _storage.write(key: 'appTheme', value: settings.appTheme.toString());
    await _storage.write(
      key: 'appLocale',
      value: settings.appLocale.toString(),
    );
  }
}
