import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class TaggedWidget extends StatelessWidget {
  const TaggedWidget({super.key, required this.tag, this.child});

  final Widget? child;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tag,
          textAlign: TextAlign.start,
          style: Fonts.titleM,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        if (child != null) child!,
      ],
    );
  }
}
