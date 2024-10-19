import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/campus_square_calendar.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/campus_square_detail.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              CampusSquareCalendar(),
              CampusSquareDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
