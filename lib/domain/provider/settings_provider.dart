import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uaizu_app/domain/repository/settings_repository_impl.dart';
import 'package:uaizu_app/infrastructure/database/settings_database.dart';

final _settingsDataBaseProvider = Provider<SettingsDatabase>(
  (_) => SettingsDatabase(const FlutterSecureStorage()),
);

final settingsRepositoryProvider = Provider(
  (ref) => SettingsRepositoryImpl(ref.watch(_settingsDataBaseProvider)),
);
