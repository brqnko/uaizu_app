import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';
import 'package:uaizu_app/domain/entity/notification.dart';

class NotificationSender {
  const NotificationSender(this._plugin, this._notificationIdMap);

  final FlutterLocalNotificationsPlugin _plugin;

  final Map<Notification, int> _notificationIdMap;

  Future<void> send(Notification notification) async {
    await _plugin.zonedSchedule(
      _calculateNotificationId(notification),
      notification.title,
      notification.body,
      TZDateTime.from(notification.scheduledDate, local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancel(Notification notification) async {
    final notificationId = _notificationIdMap[notification];
    if (notificationId != null) {
      await _plugin.cancel(notificationId);
    }
  }

  int _calculateNotificationId(Notification notification) {
    return notification.hashCode;
  }
}
