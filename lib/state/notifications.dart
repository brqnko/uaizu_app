import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/notification.dart';
import 'package:uaizu_app/domain/provider/notification_repository_provider.dart';

final notificationManagerProvider =
    NotifierProvider<NotificationManagerNotifier, NotificationManager>(
        NotificationManagerNotifier.new,);

class NotificationManagerNotifier extends Notifier<NotificationManager> {
  Future<void> add(Notification notification) async {
    await ref.read(notificationProvider).sendNotification(
          notification.copyWith(
            scheduledDate: DateTime.now().copyWith(
              year: notification.scheduledDate.year,
              month: notification.scheduledDate.month,
              day: notification.scheduledDate.day,
              hour: notification.scheduledDate.hour,
              minute: notification.scheduledDate.minute,
              second: notification.scheduledDate.second,
            ),
          ),
        );

    state = state.copyWith(
      upcomingNotifications: {...state.upcomingNotifications}
        ..add(notification),
    );
  }

  void remove(Notification notification) {
    state = state.copyWith(
      upcomingNotifications: {...state.upcomingNotifications}
        ..remove(notification),
      confirmedNotifications: {...state.confirmedNotifications}
        ..add(notification),
    );
  }

  @override
  NotificationManager build() {
    return const NotificationManager(
      upcomingNotifications: {},
      confirmedNotifications: {},
    );
  }
}
