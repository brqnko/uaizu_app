import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.isThreeLine = false,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool isThreeLine;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: backgroundColor,
      child: ListTile(
        title: Text(
          title,
          style: Fonts.bodyM.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              )
            : null,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
        isThreeLine: isThreeLine,
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomListTile(
      title: title,
      subtitle: subtitle,
      leading: leading != null
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: leading,
            )
          : null,
      trailing: trailing ??
          Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
      onTap: onTap,
    );
  }
}

class BookListItem extends StatelessWidget {
  const BookListItem({
    required this.title,
    required this.author,
    this.isbn,
    this.isAvailable = true,
    this.onTap,
    super.key,
  });

  final String title;
  final String author;
  final String? isbn;
  final bool isAvailable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomListTile(
      title: title,
      subtitle: author + (isbn != null ? '\nISBN: $isbn' : ''),
      isThreeLine: isbn != null,
      leading: Container(
        width: 40,
        height: 56,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.book,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isAvailable
                  ? colorScheme.primaryContainer
                  : colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              isAvailable ? '利用可能' : '貸出中',
              style: Fonts.bodyS.copyWith(
                color: isAvailable
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onErrorContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    this.onTap,
    super.key,
  });

  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomListTile(
      title: title,
      subtitle: '$message\n${_formatTimestamp(timestamp)}',
      isThreeLine: true,
      backgroundColor:
          isRead ? null : colorScheme.primaryContainer.withOpacity(0.1),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isRead ? colorScheme.surfaceVariant : colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.notifications,
          color: isRead ? colorScheme.onSurfaceVariant : colorScheme.onPrimary,
          size: 20,
        ),
      ),
      trailing: !isRead
          ? Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
      onTap: onTap,
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}日前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}時間前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分前';
    } else {
      return 'たった今';
    }
  }
}
