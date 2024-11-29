import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/use_case/lms_usecase.dart';

final _dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

class LmsDetail extends HookConsumerWidget {
  const LmsDetail(this._date, {super.key});

  final DateTime _date;

  Widget _buildLectureTile(
    BuildContext context,
    LmsTask note,
    ColorScheme colorScheme,
  ) {
    final courseInfoColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note.title,
          style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
        ),
        Text(
          _dateFormat.format(note.date),
          style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );

    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        child: courseInfoColumn,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                note.title,
                style: Fonts.titleL.copyWith(color: colorScheme.onSurface),
              ),
              content: Container(
                width: 500,
                height: 300,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Text(
                        'activity link',
                        style: Fonts.bodyM
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Text(
                        'task link',
                        style: Fonts.bodyM
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLectureColumn(
    BuildContext context,
    ColorScheme colorScheme,
    List<LmsTask> lectures,
  ) {
    return Column(
      children: lectures.asMap().entries.map((entry) {
        final index = entry.key;
        final lecture = entry.value;

        BorderRadius? radius;
        if (index == 0) {
          radius = const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          );
        } else if (index == lectures.length - 1) {
          radius = const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          );
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: radius,
            //
          ),
          child: _buildLectureTile(
            context,
            lecture,
            colorScheme,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskFuture = useMemoized(
      () {
        return ref.watch(getLmsTaskDayUseCaseProvider).call(
              LmsTaskDayUseCaseParam(
                date: _date,
              ),
            );
      },
      [_date],
    );
    final task = useFuture(taskFuture);

    final colorScheme = Theme.of(context).colorScheme;

    return task.connectionState == ConnectionState.done && task.hasData
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    _dateFormat.format(_date),
                    textAlign: TextAlign.start,
                    style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 8),
              if (task.data!.isNotEmpty)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: _buildLectureColumn(context, colorScheme, task.data!),
                ),
              const SizedBox(height: 8),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
