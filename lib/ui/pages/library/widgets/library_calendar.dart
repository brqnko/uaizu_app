import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/future_body.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/use_case/library_usecase.dart';

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
          style: Fonts.bodyS.copyWith(color: Colors.black54),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

class LibraryCalendar extends HookConsumerWidget {
  const LibraryCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final month = useState(_flatToMonth(DateTime.now()));
    final calendarFormat = useState(CalendarFormat.month);
    final isFourYear = useState(true);

    final calendarFuture = useMemoized(
      () {
        return ref.watch(getLibraryCalendarUseCaseProvider).call(
              GetLibraryCalenderUseCaseParam(
                query: LibraryCalenderQuery(
                  time: month.value,
                  isFourYear: isFourYear.value,
                ),
              ),
            );
      },
      [month.value, isFourYear.value],
    );

    final calendar = useFuture(calendarFuture);

    final colors = futureBody(
      calendar,
      (data) => Column(
        children: calendar.data!.calender[month.value]!.calenderColors.entries
            .map((e) => _buildContainerFromColor(e.key, e.value, colorScheme))
            .toList(),
      ),
    );

    final tableCalendar = futureBody(
      calendar,
      (data) => TableCalendar(
        availableGestures: AvailableGestures.none,
        firstDay: DateTime.utc(1993, 4),
        lastDay: DateTime.utc(2030, 3, 31),
        focusedDay: month.value,
        calendarFormat: calendarFormat.value,
        onFormatChanged: (format) => calendarFormat.value = format,
        onPageChanged: (newFocusedDay) => month.value = newFocusedDay,
        calendarBuilders: CalendarBuilders(
          selectedBuilder: (context, date, events) {
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
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
                color: _colorFromDate(date, calendar.data!),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                date.day.toString(),
                style: Fonts.bodyS.copyWith(color: Colors.black54),
              ),
            );
          },
          defaultBuilder: (context, date, events) {
            return Container(
              margin: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _colorFromDate(date, calendar.data!),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                date.day.toString(),
                style: Fonts.bodyS.copyWith(color: Colors.black54),
              ),
            );
          },
        ),
      ),
    );

    return HorizontalExpandedContainer(
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
                onPressed: () => isFourYear.value = !isFourYear.value,
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
                child: Text(
                  isFourYear.value ? '2年制大学' : '4年制大学',
                  style: Fonts.titleS.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          tableCalendar,
          const SizedBox(height: 16),
          colors,
        ],
      ),
    );
  }
}
