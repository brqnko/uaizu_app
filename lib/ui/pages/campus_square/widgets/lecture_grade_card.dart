import 'package:flutter/material.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';

class LectureGradeCard extends StatelessWidget {
  const LectureGradeCard({super.key, required this.grade});

  final SubjectGrade grade;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return HorizontalExpandedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            grade.subjectTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          RichText(
            text: TextSpan(
              children: [
                // score
                WidgetSpan(
                  child: Icon(
                    Icons.score_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.score,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
                // grade
                WidgetSpan(
                  child: Icon(
                    Icons.grade_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.grade,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
                // result
                WidgetSpan(
                  child: Icon(
                    Icons.gavel_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.result,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
                //
                WidgetSpan(
                  child: Icon(
                    Icons.numbers_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.code,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
