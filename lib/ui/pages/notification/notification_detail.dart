import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as app_notification;
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/notifications.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class NotificationDetailPage extends ConsumerWidget {
  const NotificationDetailPage({
    super.key,
    required this.notificationId,
  });

  final String notificationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final notificationManager = ref.watch(notificationManagerProvider);

    final notification = [
      ...notificationManager.upcomingNotifications,
      ...notificationManager.confirmedNotifications,
    ].where((n) => n.hashCode.toString() == notificationId).firstOrNull;

    if (notification == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          title: Text(
            l10n.notification,
            style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colorScheme.onPrimaryFixed),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Text(l10n.error),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          l10n.notification,
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onPrimaryFixed),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: colorScheme.onPrimaryFixed),
            onPressed: () =>
                _showDeleteDialog(context, ref, notification, l10n),
          ),
        ],
      ),
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.titleLabel,
                      style: Fonts.labelM.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.title,
                      style:
                          Fonts.titleL.copyWith(color: colorScheme.onSurface),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.contentLabel,
                      style: Fonts.labelM.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.body,
                      style: Fonts.bodyL.copyWith(color: colorScheme.onSurface),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.notificationTimeLabel,
                      style: Fonts.labelM.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatDateTime(notification.scheduledDate),
                      style: Fonts.bodyL.copyWith(color: colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    app_notification.Notification notification,
    AppLocalizations l10n,
  ) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.confirmDelete),
          content: Text(l10n.deleteNotificationMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                await ref
                    .read(notificationManagerProvider.notifier)
                    .remove(notification);
                if (context.mounted) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.delete),
            ),
          ],
        );
      },
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
