import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
class NotificationManager with _$NotificationManager {
  const factory NotificationManager({
    required Set<Notification> confirmedNotifications,
    required Set<Notification> upcomingNotifications,
  }) = _NotificationManager;
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String title,
    required String body,
    required String payload,
    required DateTime scheduledDate,
    required int sourceHash,
  }) = _Notification;
}
