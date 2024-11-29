import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/campus_square_detail.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

DateTime _flatToDay(DateTime flat) {
  return DateTime.utc(flat.year, flat.month, flat.day);
}

class CampusSquareCalendar extends HookConsumerWidget {
  const CampusSquareCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorScheme = Theme.of(context).colorScheme;

    final calendarFormat = useState(CalendarFormat.month);
    final focusedDay = useState(_flatToDay(DateTime.now()));

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

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: tableCalender,
        ),
        CampusSquareDetail(focusedDay.value),
      ],
    );
  }
}
