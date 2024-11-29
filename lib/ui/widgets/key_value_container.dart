import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class KeyValueContainer extends StatelessWidget {
  const KeyValueContainer({
    super.key,
    required this.keyString,
    required this.valueString,
    required this.keyIcon,
  });

  final String keyString;
  final String valueString;
  final IconData keyIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    keyIcon,
                    size: 36,
                    color: colorScheme.onSurface,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                  text: keyString,
                  style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            valueString,
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
