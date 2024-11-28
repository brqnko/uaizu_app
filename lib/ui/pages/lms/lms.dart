import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/pages/lms/widget/lms_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class LMSPage extends StatelessWidget {
  const LMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      title: Center(
        child: Text(
          'Moodle',
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: LmsCalendar(),
        ),
      ),
    );
  }
}
