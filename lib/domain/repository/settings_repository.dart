import 'package:uaizu_app/domain/entity/settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> loadSettings();

  Future<void> saveSettings(AppSettings settings);
}
