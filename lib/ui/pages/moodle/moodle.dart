import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/ui/pages/moodle/widgets/moodle_calendar.dart';
import 'package:uaizu_app/ui/pages/moodle/widgets/moodle_detail.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';

class MoodlePage extends HookWidget {
  const MoodlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final focusedDay = useState(DateTime.now());

    final appBar = brandAppBar(context, title: l10n.moodle);

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              LmsCalendar(focusedDay: focusedDay),
              const SizedBox(height: 16),
              LmsDetail(focusedDay: focusedDay),
            ],
          ),
        ),
      ),
    );
  }
}
