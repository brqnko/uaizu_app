import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: elevation ?? 2,
        color: backgroundColor ?? colorScheme.surface,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    required this.title,
    required this.child,
    this.padding,
    this.backgroundColor,
    super.key,
  });

  final String title;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: Fonts.bodyM.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
