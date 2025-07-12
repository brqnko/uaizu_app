import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as app_notification;
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/notifications.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';

class MoodleTaskBottomSheet extends ConsumerWidget {
  const MoodleTaskBottomSheet({super.key, required this.note});

  final LmsTask note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return HorizontalExpandedContainer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              note.title,
              style: Fonts.titleL.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(
                Icons.schedule,
                color: colorScheme.onSurface,
              ),
              title: Text(
                l10n.taskDeadline(_formatDateTime(note.date)),
                style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.link,
                color: colorScheme.onSurface,
              ),
              title: Text(
                l10n.activityLink,
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.assignment,
                color: colorScheme.onSurface,
              ),
              title: Text(
                l10n.taskLink,
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _addNotificationForTask(context, ref),
                icon: const Icon(Icons.notification_add),
                label: Text(l10n.addNotificationToSchedule),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.close),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addNotificationForTask(
      BuildContext context, WidgetRef ref,) async {
    final l10n = AppLocalizations.of(context)!;
    final reminderTime = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
      initialDate: note.date.subtract(const Duration(hours: 1)),
      maximumDate: note.date,
      minimumDate: DateTime.now(),
    );

    if (reminderTime != null && context.mounted) {
      final notification = app_notification.Notification(
        title: 'Moodle: ${note.title}',
        body: l10n.taskDeadlineApproaching(_formatDateTime(note.date)),
        payload: 'moodle_task',
        scheduledDate: reminderTime,
        sourceHash: note.hashCode,
      );

      try {
        await ref.read(notificationManagerProvider.notifier).add(notification);
        if (context.mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.notificationAdded)),
          );
        }
      } on Exception catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(l10n.errorOccurredWithDetails(e.toString())),),
          );
        }
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

class MoodleTaskDialog extends ConsumerWidget {
  const MoodleTaskDialog({super.key, required this.note});

  final LmsTask note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(
        note.title,
        style: Fonts.titleL.copyWith(color: colorScheme.onSurface),
      ),
      content: Container(
        width: 500,
        height: 300,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.taskDeadline(_formatDateTime(note.date)),
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            InkWell(
              child: Text(
                l10n.activityLink,
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 8),
            InkWell(
              child: Text(
                l10n.taskLink,
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              onTap: () {},
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _addNotificationForTask(context, ref),
                icon: const Icon(Icons.notification_add),
                label: Text(l10n.addNotificationToSchedule),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.close),
        ),
      ],
    );
  }

  Future<void> _addNotificationForTask(
      BuildContext context, WidgetRef ref,) async {
    final l10n = AppLocalizations.of(context)!;
    final reminderTime = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
      initialDate: note.date.subtract(const Duration(hours: 1)),
      maximumDate: note.date,
      minimumDate: DateTime.now(),
    );

    if (reminderTime != null && context.mounted) {
      final notification = app_notification.Notification(
        title: 'Moodle: ${note.title}',
        body: l10n.taskDeadlineApproaching(_formatDateTime(note.date)),
        payload: 'moodle_task',
        scheduledDate: reminderTime,
        sourceHash: note.hashCode,
      );

      try {
        await ref.read(notificationManagerProvider.notifier).add(notification);
        if (context.mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.notificationAdded)),
          );
        }
      } on Exception catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(l10n.errorOccurredWithDetails(e.toString())),),
          );
        }
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
