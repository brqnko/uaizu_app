import 'package:flutter/material.dart';

class CloseDialog extends StatelessWidget {
  const CloseDialog({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: ElevatedButton(
        onPressed: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pop('dialog'),
        child: const Text('Close'),
      ),
    );
  }
}
