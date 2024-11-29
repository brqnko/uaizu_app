import 'package:flutter/material.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class ToeicScoreText extends StatelessWidget {
  const ToeicScoreText({super.key, required this.score});

  final ToeicScore? score;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (score == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: const Text('No data'),
      );
    }

    final scoreNotNull = score!;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: scoreNotNull.date.toLocal().toString().split(' ')[0],
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          // total
          const WidgetSpan(
            child: SizedBox(width: 16),
          ),
          WidgetSpan(
            child: Icon(
              Icons.score_outlined,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: scoreNotNull.score.toString(),
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          // reading
          const WidgetSpan(
            child: SizedBox(width: 16),
          ),
          WidgetSpan(
            child: Icon(
              Icons.book_outlined,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: scoreNotNull.reqdingScore.toString(),
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const WidgetSpan(
            child: SizedBox(width: 16),
          ),
          // listening
          WidgetSpan(
            child: Icon(
              Icons.headphones_outlined,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: scoreNotNull.listeningScore.toString(),
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
