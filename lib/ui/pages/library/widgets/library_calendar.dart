import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/state/library_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

DateTime _flatToMonth(DateTime date) {
  return DateTime.utc(date.year, date.month);
}

DateTime _flatToDay(DateTime date) {
  return DateTime.utc(date.year, date.month, date.day);
}

Color _formatCalendarColor(int color) {
  if (color == 0xFFFFFFFF) {
    return const Color(0xFFEAEAEA);
  } else {
    return Color(color);
  }
}

Color _colorFromDate(
  DateTime date,
  LibraryCalendarEntire calendar,
) {
  final flat = _flatToMonth(date.toUtc());
  final day = _flatToDay(date);
  if (calendar.calender.containsKey(flat)) {
    final calendarMonth = calendar.calender[flat]!;
    if (calendarMonth.calender.containsKey(day)) {
      return _formatCalendarColor(calendarMonth.calender[day]!.colorHex);
    } else {
      return Colors.red;
    }
  } else {
    return Colors.transparent;
  }
}

final _calendarFormatProvider = StateProvider((ref) => CalendarFormat.month);

Widget _buildContainerFromColor(
  int colorHex,
  String text,
  ColorScheme colorScheme,
) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _formatCalendarColor(colorHex),
        ),
        child: Text(
          text,
          // not use color scheme because
          // the background color depends on something
          style: Fonts.bodyS.copyWith(color: Colors.black54),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

class LibraryCalendar extends ConsumerWidget {
  const LibraryCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final openingCalendar = ref.watch(libraryCalendarProvider);

    final colors = openingCalendar.when(
      data: (data) {
        final flat = _flatToMonth(ref.watch(libraryCalendarMonthProvider));
        if (data.calender.containsKey(flat)) {
          return Column(
            children: data.calender[flat]!.calenderColors.entries
                .map((e) =>
                    _buildContainerFromColor(e.key, e.value, colorScheme))
                .toList(),
          );
        } else {
          return null;
        }
      },
      loading: () => null,
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
    );

    final tableCalendar = openingCalendar.when(
      data: (data) {
        return TableCalendar(
          availableGestures: AvailableGestures.none,
          firstDay: DateTime.utc(1993, 4),
          lastDay: DateTime.utc(2030, 3, 31),
          focusedDay: ref.watch(libraryCalendarMonthProvider),
          calendarFormat: ref.watch(_calendarFormatProvider),
          onFormatChanged: (format) {
            ref.read(_calendarFormatProvider.notifier).state = format;
          },
          onPageChanged: (newFocusedDay) {
            ref.watch(libraryCalendarMonthProvider.notifier).state =
                newFocusedDay;
            ref.read(libraryCalendarProvider.notifier).requestUpdate();
          },
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) {
              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: _colorFromDate(date, data),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  date.day.toString(),
                ),
              );
            },
            todayBuilder: (context, date, events) {
              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _colorFromDate(date, data),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  date.day.toString(),
                  // not use color scheme because
                  // the background color depends on something
                  style: Fonts.bodyS.copyWith(color: Colors.black54),
                ),
              );
            },
            defaultBuilder: (context, date, events) {
              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _colorFromDate(date, data),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  date.day.toString(),
                  // not use color scheme because
                  // the background color depends on something
                  style: Fonts.bodyS.copyWith(color: Colors.black54),
                ),
              );
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
    );

    final calendar = Container(
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '開館カレンダー',
                style: Fonts.titleM.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  ref.read(libraryCalendarIsFourYearProvider.notifier).state =
                      !ref.read(libraryCalendarIsFourYearProvider);
                  ref.read(libraryCalendarProvider.notifier).requestUpdate();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
                child: Text(
                  ref.watch(libraryCalendarIsFourYearProvider)
                      ? '2年制大学'
                      : '4年制大学',
                  style: Fonts.titleS.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          tableCalendar,
          const SizedBox(height: 16),
          if (colors != null) colors,
        ],
      ),
    );

    return calendar;
  }
}
