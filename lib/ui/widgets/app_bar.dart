import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

AppBar appBar(BuildContext context, String title) {
  final colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    toolbarHeight: 75,
    backgroundColor: colorScheme.primary,
    iconTheme: IconThemeData(color: colorScheme.secondary),
    title: Center(
      child: Text(
        title,
        style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
      ),
    ),
  );
}
