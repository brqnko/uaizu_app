import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/ui/pages/moodle/widgets/moodle_task_dialog.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/future_body.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';
import 'package:uaizu_app/use_case/lms_usecase.dart';

final _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

class LmsDetail extends HookConsumerWidget {
  const LmsDetail({super.key, required this.focusedDay});

  final ValueNotifier<DateTime> focusedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    
    final taskFuture = useMemoized(
      () {
        return ref.watch(getLmsTaskDayUseCaseProvider).call(
              LmsTaskDayUseCaseParam(
                date: focusedDay.value,
              ),
            );
      },
      [focusedDay.value],
    );

    final task = useFuture(taskFuture);

    final colorScheme = Theme.of(context).colorScheme;

    return futureBody(
      task,
      (data) {
        return TaggedWidget(
          tag: _dateFormat.format(focusedDay.value),
          child: HorizontalExpandedContainer(
            child: Wrap(
              runSpacing: 16,
              children: data.asMap().entries.map((entry) {
                final note = entry.value;

                return InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style:
                            Fonts.titleM.copyWith(color: colorScheme.onSurface),
                      ),
                      Text(
                        _dateFormat.format(note.date),
                        style: Fonts.bodyM
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) =>
                        MoodleTaskDialog(note: note),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
      l10n,
    );
  }
}
