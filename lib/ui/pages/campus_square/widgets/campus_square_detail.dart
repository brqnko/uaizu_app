import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/state/campus_square_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

extension on CampusSquareCalendarLectureType {
  Color color(ColorScheme colorScheme) {
    switch (this) {
      case CampusSquareCalendarLectureType.kyuko:
        return Colors.red;
      case CampusSquareCalendarLectureType.kaiko:
        return colorScheme.secondary;
      case CampusSquareCalendarLectureType.hoko:
        return Colors.lightBlueAccent;
    }
  }
}

class CampusSquareDetail extends ConsumerWidget {
  const CampusSquareDetail({super.key});

  Widget _buildLectureTile(
    BuildContext context,
    CampusSquareCalendarLecture note,
    ColorScheme colorScheme,
  ) {
    final courseInfoColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note.courseName,
          style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
        ),
        Text(
          '${note.timeSlot} ${note.location}',
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
                note.courseName,
                style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
              ),
              content: Container(
                width: 500,
                height: 300,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.timeSlot,
                      style: Fonts.bodyM
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    Text(
                      note.location,
                      style: Fonts.bodyM
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    InkWell(
                      child: Text(
                        'Syllabus',
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
    List<CampusSquareCalendarLecture> lectures,
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
            color: lecture.type.color(colorScheme),
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

    return ref.watch(campusSquareCalendarDayScheduleProvider).when(
          data: (data) {
            final dateFormat = DateFormat(
              'yyyy/MM/dd(E)',
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      dateFormat.format(data.day),
                      textAlign: TextAlign.start,
                      style:
                          Fonts.titleL.copyWith(color: colorScheme.onSurface),
                    ),
                    const Spacer(),
                  ],
                ),
                if (data.notes.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: data.notes.map((note) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            note,
                            textAlign: TextAlign.start,
                            style: Fonts.titleM
                                .copyWith(color: colorScheme.onSurface),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                if (data.notes.isNotEmpty) const SizedBox(height: 16),
                if (data.lectures.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: _buildLectureColumn(
                        context, colorScheme, data.lectures),
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
