import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/schedule_lecture_dialog.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/future_body.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';
import 'package:uaizu_app/use_case/campus_square_usecase.dart';

extension on CampusSquareCalendarLectureType {
  Color color(ColorScheme colorScheme) {
    switch (this) {
      case CampusSquareCalendarLectureType.kyuko:
        return Colors.blue;
      case CampusSquareCalendarLectureType.kaiko:
        return colorScheme.onSurface;
      case CampusSquareCalendarLectureType.hoko:
        return Colors.red;
    }
  }
}

final _dateFormat = DateFormat('yyyy/MM/dd(E)');

class CampusSquareDetail extends HookConsumerWidget {
  const CampusSquareDetail({super.key, required this.focusedDay});

  final ValueNotifier<DateTime> focusedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final scheduleFuture = useMemoized(
      () {
        return ref.watch(getCampusSquareCalenderDayUseCacseProvider).call(
              GetCampusSquareCalenderDayUseCaseParam(
                date: focusedDay.value,
                useCache: true,
              ),
            );
      },
      [focusedDay.value],
    );

    final schedule = useFuture(scheduleFuture);

    return futureBody(
      schedule,
      (data) => TaggedWidget(
        tag: _dateFormat.format(focusedDay.value),
        child: Column(
          children: [
            if (data.notes.isNotEmpty)
              HorizontalExpandedContainer(
                child: Wrap(
                  runSpacing: 16,
                  children: data.notes.map((note) {
                    return Text(
                      note,
                      textAlign: TextAlign.start,
                      style:
                          Fonts.titleM.copyWith(color: colorScheme.onSurface),
                    );
                  }).toList(),
                ),
              ),
            if (data.lectures.isNotEmpty && data.notes.isNotEmpty)
              const SizedBox(height: 16),
            if (data.lectures.isNotEmpty)
              HorizontalExpandedContainer(
                child: Wrap(
                  runSpacing: 16,
                  children: data.lectures.asMap().entries.map((entry) {
                    final note = entry.value;

                    return InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.courseName,
                            style: Fonts.titleM
                                .copyWith(color: note.type.color(colorScheme)),
                          ),
                          Text(
                            '${note.timeSlot} ${note.location}',
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => ScheduleLectureBottomSheet(note),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
