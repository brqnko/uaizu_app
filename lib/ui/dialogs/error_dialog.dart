import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.exception});

  final Exception exception;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(exception.toString()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop('dialog'),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
