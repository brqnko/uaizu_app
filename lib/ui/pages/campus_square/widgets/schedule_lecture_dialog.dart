import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as notification;
import 'package:uaizu_app/state/notifications.dart';
import 'package:uaizu_app/ui/dialogs/set_reminder_dialog.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';

extension on CampusSquareCalendarLectureType {
  String get title {
    switch (this) {
      case CampusSquareCalendarLectureType.kyuko:
        return '休講';
      case CampusSquareCalendarLectureType.kaiko:
        return '開講';
      case CampusSquareCalendarLectureType.hoko:
        return '補講';
    }
  }
}

final _dateFormat = DateFormat('HH:mm');

class ScheduleLectureBottomSheet extends ConsumerWidget {
  const ScheduleLectureBottomSheet(this.note, {super.key});

  final CampusSquareCalendarLecture note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return HorizontalExpandedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.calendar_today_outlined,
              color: colorScheme.onSurface,
            ),
            title: Text(
              note.courseName,
              style: Fonts.titleL.copyWith(color: colorScheme.onSurface),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.access_time_outlined,
              color: colorScheme.onSurface,
            ),
            title: Text(
              '${note.timeSlot} (${_dateFormat.format(note.startTime)} ~ ${_dateFormat.format(note.endTime)})',
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: colorScheme.onSurface,
            ),
            title: Text(
              note.location,
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: colorScheme.onSurface,
            ),
            title: Text(
              note.type.title,
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none_outlined,
              color: colorScheme.onSurface,
            ),
            title: Text(
              'リマインダー ${ref.watch(notificationManagerProvider).upcomingNotifications.where((e) => e.sourceHash == note.hashCode).length}件',
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
            ),
            onTap: () => showSetReminderDialog(
              context,
              ref,
              note.endTime,
              note.startTime,
              (date) => notification.Notification(
                title: note.courseName,
                body: '${note.timeSlot} ${note.location}',
                scheduledDate: date,
                payload: '',
                sourceHash: note.hashCode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
