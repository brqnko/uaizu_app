import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

AppBar brandAppBar(
  BuildContext context, {
  String? title,
  Widget? child,
  double? height,
  Color? color,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    toolbarHeight: height ?? 75,
    backgroundColor: color ?? colorScheme.primary,
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    title: title == null
        ? child
        : Center(
            child: Text(
              title,
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
          ),
  );
}

AppBar brandAppBarWithOptions(BuildContext context, List<Widget> widgets) {
  final colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    toolbarHeight: 55,
    backgroundColor: colorScheme.onPrimaryContainer,
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    automaticallyImplyLeading: false,
    title: SizedBox(
      height: 34,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        itemCount: widgets.length,
        itemBuilder: (_, index) => widgets[index],
      ),
    ),
  );
}
