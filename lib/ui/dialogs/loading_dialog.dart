import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uaizu_app/ui/dialogs/error_dialog.dart';

class LoadingDialog<T> extends HookWidget {
  const LoadingDialog(
      {super.key,
      required this.title,
      required this.future,
      required this.onSuccessful,});

  final String title;

  final Future<T> future;

  final Widget Function(BuildContext context) onSuccessful;

  @override
  Widget build(BuildContext context) {
    final v = useFuture(future);

    if (v.hasError) {
      return ErrorDialog(exception: v.error! as Exception);
    }
    if (v.connectionState == ConnectionState.done) {
      return onSuccessful(context);
    }
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Text(title),
        ],
      ),
    );
  }
}
