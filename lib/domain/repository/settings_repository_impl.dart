import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/domain/repository/settings_repository.dart';
import 'package:uaizu_app/infrastructure/data_source/settings_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._dataSource);

  final SettingsDataSource _dataSource;

  @override
  Future<AppSettings> loadSettings() {
    return _dataSource.loadSettings();
  }

  @override
  Future<void> saveSettings(AppSettings settings) {
    return _dataSource.saveSettings(settings);
  }
}
