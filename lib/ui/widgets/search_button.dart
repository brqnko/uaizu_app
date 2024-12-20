import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.search,
                size: 18,
                color: colorScheme.onSurface,
              ),
            ),
            TextSpan(
              text: '検索',
              style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
