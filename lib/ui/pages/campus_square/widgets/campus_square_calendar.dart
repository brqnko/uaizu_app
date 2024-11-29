import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class CampusSquareCalendar extends HookConsumerWidget {
  const CampusSquareCalendar({super.key, required this.focusedDay});

  final ValueNotifier<DateTime> focusedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final calendarFormat = useState(CalendarFormat.month);

    final tableCalender = TableCalendar(
      availableGestures: AvailableGestures.none,
      firstDay: DateTime.utc(1993, 4),
      lastDay: DateTime.utc(2030, 3, 31),
      focusedDay: focusedDay.value,
      calendarFormat: calendarFormat.value,
      selectedDayPredicate: (day) {
        return isSameDay(focusedDay.value, day);
      },
      onFormatChanged: (format) {
        calendarFormat.value = format;
      },
      onDaySelected: (_, newFocusedDay) {
        focusedDay.value = newFocusedDay;
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
