import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/domain/repository/settings_repository.dart';
import 'package:uaizu_app/infrastructure/database/settings_database.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._database);

  final SettingsDatabase _database;

  @override
  Future<AppSettings> loadSettings() {
    return _database.loadSettings();
  }

  @override
  Future<void> saveSettings(AppSettings settings) {
    return _database.saveSettings(settings);
  }
}
