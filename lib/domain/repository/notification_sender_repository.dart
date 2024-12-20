import 'package:uaizu_app/domain/entity/notification.dart';

abstract class NotificationSenderRepository {
  Future<void> sendNotification(Notification notification);
  Future<void> cancelNotification(Notification notification);
}
