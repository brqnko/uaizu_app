import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class BrandDropdownButton extends StatelessWidget {
  const BrandDropdownButton({
    super.key,
    required this.index,
    required this.values,
  });

  final ValueNotifier<int> index;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DropdownButton(
      value: values[index.value],
      onChanged: (String? value) {
        if (value == null) {
          return;
        }
        index.value = values.indexOf(value);
      },
      items: values.map((q) {
        return DropdownMenuItem(
          value: q,
          child: Text(
            q,
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        );
      }).toList(),
    );
  }
}
