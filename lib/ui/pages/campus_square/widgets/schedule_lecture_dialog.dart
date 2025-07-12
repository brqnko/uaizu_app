import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as app_notification;
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/notifications.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';

extension on CampusSquareCalendarLectureType {
  String title(AppLocalizations l10n) {
    switch (this) {
      case CampusSquareCalendarLectureType.kyuko:
        return l10n.classCancel;
      case CampusSquareCalendarLectureType.kaiko:
        return l10n.classOpen;
      case CampusSquareCalendarLectureType.hoko:
        return l10n.makeupClass;
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
    final l10n = AppLocalizations.of(context)!;

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
              note.type.title(l10n),
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _addNotificationForLecture(context, ref),
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
        ],
      ),
    );
  }

  Future<void> _addNotificationForLecture(
      BuildContext context, WidgetRef ref,) async {
    final l10n = AppLocalizations.of(context)!;
    final reminderTime = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
      initialDate: note.startTime.subtract(const Duration(minutes: 15)),
      maximumDate: note.startTime,
      minimumDate: DateTime.now(),
    );

    if (reminderTime != null && context.mounted) {
      final notification = app_notification.Notification(
        title: 'Campus Square: ${note.courseName}',
        body: l10n.classWillStart(note.timeSlot, note.location),
        payload: 'campus_square_lecture',
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
}
