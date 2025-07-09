import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/repository/notification_sender_repository_impl.dart';
import 'package:uaizu_app/infrastructure/notification_sender/notification_sender.dart';

final _notificationSenderProvider = Provider((ref) {
  return NotificationSender(FlutterLocalNotificationsPlugin(), {});
});

final notificationSenderProvider = Provider((ref) {
  return NotificationSenderRepositoryImpl(
    ref.watch(_notificationSenderProvider),
  );
});
