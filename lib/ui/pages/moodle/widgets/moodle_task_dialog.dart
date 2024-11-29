import 'package:flutter/material.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class MoodleTaskDialog extends StatelessWidget {
  const MoodleTaskDialog({super.key, required this.note});

  final LmsTask note;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              onTap: () {},
            ),
            InkWell(
              child: Text(
                'task link',
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
