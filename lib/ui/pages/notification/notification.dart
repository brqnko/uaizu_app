import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as app_notification;
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/notifications.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final notificationManager = ref.watch(notificationManagerProvider);

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      title: Center(
        child: Text(
          l10n.notification,
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add, color: colorScheme.onPrimaryFixed),
          onPressed: () => context.push('/notification/add'),
        ),
      ],
    );

    final upcomingNotifications = notificationManager.upcomingNotifications
        .toList()
      ..sort((a, b) => a.scheduledDate.compareTo(b.scheduledDate));
    final confirmedNotifications = notificationManager.confirmedNotifications
        .toList()
      ..sort((a, b) => b.scheduledDate.compareTo(a.scheduledDate));

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: colorScheme.primary,
              unselectedLabelColor: colorScheme.onSurfaceVariant,
              indicatorColor: colorScheme.primary,
              tabs: [
                Tab(text: l10n.scheduled),
                Tab(text: l10n.confirmedNotifications),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildNotificationList(
                    context,
                    ref,
                    upcomingNotifications,
                    l10n.noScheduledNotifications,
                    false,
                  ),
                  _buildNotificationList(
                    context,
                    ref,
                    confirmedNotifications,
                    l10n.noConfirmedNotifications,
                    true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(
    BuildContext context,
    WidgetRef ref,
    List<app_notification.Notification> notifications,
    String emptyMessage,
    bool isConfirmed,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              emptyMessage,
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationCard(context, ref, notification, isConfirmed);
      },
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    WidgetRef ref,
    app_notification.Notification notification,
    bool isConfirmed,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isPast = notification.scheduledDate.isBefore(DateTime.now());

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isConfirmed
              ? colorScheme.surfaceContainerHighest
              : (isPast
                  ? colorScheme.errorContainer
                  : colorScheme.primaryContainer),
          child: Icon(
            isConfirmed
                ? Icons.check
                : (isPast ? Icons.warning : Icons.schedule),
            color: isConfirmed
                ? colorScheme.onSurfaceVariant
                : (isPast
                    ? colorScheme.onErrorContainer
                    : colorScheme.onPrimaryContainer),
          ),
        ),
        title: Text(
          notification.title,
          style: Fonts.titleS.copyWith(color: colorScheme.onSurface),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.body,
              style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              _formatDateTime(notification.scheduledDate),
              style: Fonts.bodyT.copyWith(
                color:
                    isPast ? colorScheme.error : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: colorScheme.onSurfaceVariant),
          onSelected: (value) {
            switch (value) {
              case 'details':
                context.push('/notification/details/${notification.hashCode}');
                break;
              case 'delete':
                _showDeleteDialog(context, ref, notification, l10n);
                break;
              case 'confirm':
                ref
                    .read(notificationManagerProvider.notifier)
                    .confirm(notification);
                break;
              case 'unconfirm':
                ref
                    .read(notificationManagerProvider.notifier)
                    .unconfirm(notification);
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'details',
              child: Row(
                children: [
                  const Icon(Icons.info),
                  const SizedBox(width: 8),
                  Text(l10n.viewDetails),
                ],
              ),
            ),
            if (!isConfirmed)
              PopupMenuItem(
                value: 'confirm',
                child: Row(
                  children: [
                    const Icon(Icons.check),
                    const SizedBox(width: 8),
                    Text(l10n.markAsConfirmed),
                  ],
                ),
              ),
            if (isConfirmed)
              PopupMenuItem(
                value: 'unconfirm',
                child: Row(
                  children: [
                    const Icon(Icons.undo),
                    const SizedBox(width: 8),
                    Text(l10n.markAsUnconfirmed),
                  ],
                ),
              ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  const Icon(Icons.delete),
                  const SizedBox(width: 8),
                  Text(l10n.delete),
                ],
              ),
            ),
          ],
        ),
        onTap: () =>
            context.push('/notification/details/${notification.hashCode}'),
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
