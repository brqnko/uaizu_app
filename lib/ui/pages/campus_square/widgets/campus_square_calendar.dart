import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uaizu_app/state/campus_square_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

final _calendarFormatProvider = StateProvider((ref) => CalendarFormat.month);

class CampusSquareCalendar extends ConsumerWidget {
  const CampusSquareCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final tableCalender = TableCalendar(
      availableGestures: AvailableGestures.none,
      firstDay: DateTime.utc(1993, 4),
      lastDay: DateTime.utc(2030, 3, 31),
      focusedDay: ref.watch(campusSquareCalendarFocusedDayProvider),
      calendarFormat: ref.watch(_calendarFormatProvider),
      selectedDayPredicate: (day) {
        return isSameDay(day, ref.read(campusSquareCalendarFocusedDayProvider));
      },
      onFormatChanged: (format) {
        ref.read(_calendarFormatProvider.notifier).state = format;
      },
      onDaySelected: (_, focusedDay) {
        ref.read(campusSquareCalendarFocusedDayProvider.notifier).state =
            focusedDay;
      },
      calendarStyle: CalendarStyle(
        todayDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: colorScheme.primary,
          shape: BoxShape.circle,
        ),
        todayTextStyle: Fonts.titleS.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        selectedTextStyle: Fonts.titleS.copyWith(
          color: colorScheme.onPrimaryFixed,
        ),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: tableCalender,
    );
  }
}
