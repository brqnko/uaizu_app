import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uaizu_app/infrastructure/data_source/settings_data_source.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/router/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appSettings =
      await SettingsDataSource(const FlutterSecureStorage()).loadSettings();

  runApp(
    ProviderScope(
      overrides: [
        settingsProvider.overrideWith(() => SettingsNotifier(appSettings)),
      ],
      child: const App(),
    ),
  );
}
