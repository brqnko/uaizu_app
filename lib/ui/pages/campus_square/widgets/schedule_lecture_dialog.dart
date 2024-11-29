import 'package:flutter/material.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class ScheduleLectureDialog extends StatelessWidget {
  const ScheduleLectureDialog({super.key, required this.note});

  final CampusSquareCalendarLecture note;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            Text(
              note.location,
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            InkWell(
              child: Text(
                'Syllabus',
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
