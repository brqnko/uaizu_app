import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/campus_square_calendar.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/campus_square_detail.dart';

DateTime _flatToDay(DateTime flat) {
  return DateTime.utc(flat.year, flat.month, flat.day);
}

class SchedulePage extends HookWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final focusedDay = useState(_flatToDay(DateTime.now()));

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CampusSquareCalendar(focusedDay: focusedDay),
              const SizedBox(height: 16),
              CampusSquareDetail(focusedDay: focusedDay),
            ],
          ),
        ),
      ),
    );
  }
}
