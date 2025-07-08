import 'package:flutter/material.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';

Widget futureBody<T>(
  AsyncSnapshot<T> snapshot,
  Widget Function(T data) builder,
  AppLocalizations l10n,
) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          Text(
            l10n.loading,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  if (snapshot.hasError) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              l10n.somethingWentWrong,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              '${snapshot.error}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  if (snapshot.hasData) {
    return builder(snapshot.data as T);
  }

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.inbox,
          size: 48,
          color: Colors.grey,
        ),
        SizedBox(height: 16),
        Text(
          l10n.noDataAvailable,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
