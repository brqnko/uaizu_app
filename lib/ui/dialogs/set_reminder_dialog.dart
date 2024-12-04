import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as notification;
import 'package:uaizu_app/state/notifications.dart';

Future<void> showSetReminderDialog(
  BuildContext context,
  WidgetRef ref,
  DateTime currentTime,
  DateTime maxTime,
  notification.Notification Function(DateTime date) notificationFactory,
) async {
  final date = await DatePicker.showDateTimePicker(
    context,
    minTime: DateTime.now(),
    maxTime: maxTime,
    currentTime: currentTime,
  );

  if (date != null) {
    try {
      await ref.read(notificationManagerProvider.notifier).add(
            notificationFactory(date),
          );
    } catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('リマインダーの設定に失敗しました'),
          ),
        );
      }
    }
  }
}
