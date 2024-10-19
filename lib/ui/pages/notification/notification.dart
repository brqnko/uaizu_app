import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      title: Center(
        child: Text(
          'Notification',
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: const Center(
        child: Text('Notification'),
      ),
    );
  }
}
