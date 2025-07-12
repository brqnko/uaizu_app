import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:timezone/data/latest.dart';
import 'package:uaizu_app/infrastructure/database/settings_database.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/router/app.dart';
import 'package:uaizu_app/ui/router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeTimeZones();

  final plugin = FlutterLocalNotificationsPlugin();
  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  await plugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    ),
    onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
  );

  final appSettings =
      await SettingsDatabase(const FlutterSecureStorage()).loadSettings();

  runApp(
    ProviderScope(
      overrides: [
        settingsProvider.overrideWith(() => SettingsNotifier(appSettings)),
      ],
      child: const App(),
    ),
  );
}

void _onDidReceiveNotificationResponse(NotificationResponse details) {
  if (details.payload == null) {
    return;
  }

  final context = rootNavigatorKey.currentContext;
  if (context != null) {
    try {
      final payload = details.payload!;

      switch (payload) {
        case 'campus_square_lecture':
          GoRouter.of(context).go('/square/calendar');
          break;
        case 'moodle_task':
          GoRouter.of(context).go('/moodle');
          break;
        default:
          if (payload.startsWith('notification_id:')) {
            final notificationId = payload.split(':')[1];
            GoRouter.of(context).go('/notification/details/$notificationId');
          } else {
            GoRouter.of(context).go('/notification');
          }
          break;
      }
    } on Exception {
    }
  }
}
