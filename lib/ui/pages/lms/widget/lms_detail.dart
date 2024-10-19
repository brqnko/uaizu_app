import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/state/lms_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

final _dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

class LmsDetail extends ConsumerWidget {
  const LmsDetail({super.key});

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
    final colorScheme = Theme.of(context).colorScheme;

    return ref.watch(lmsCalendarTaskDayProvider).when(
          data: (data) {
            final dateFormat = DateFormat('yyyy/MM/dd(E)');

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      dateFormat
                          .format(ref.watch(lmsCalendarFocusedDaProvider)),
                      textAlign: TextAlign.start,
                      style:
                          Fonts.titleM.copyWith(color: colorScheme.onSurface),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                if (data.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: _buildLectureColumn(context, colorScheme, data),
                  ),
                const SizedBox(height: 8),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            return Text(
              error.toString(),
              style: Fonts.bodyM.copyWith(
                color: colorScheme.error,
              ),
            );
          },
        );
  }
}
