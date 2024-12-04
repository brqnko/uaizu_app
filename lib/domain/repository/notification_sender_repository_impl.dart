import 'package:uaizu_app/domain/entity/notification.dart';
import 'package:uaizu_app/domain/repository/notification_sender_repository.dart';
import 'package:uaizu_app/infrastructure/notification_sender/notification_sender.dart';

class NotificationSenderRepositoryImpl implements NotificationSenderRepository {
  const NotificationSenderRepositoryImpl(this._sender);

  final NotificationSender _sender;

  @override
  Future<void> cancelNotification(Notification notification) {
    return _sender.cancel(notification);
  }

  @override
  Future<void> sendNotification(Notification notification) {
    return _sender.send(notification);
  }
}
