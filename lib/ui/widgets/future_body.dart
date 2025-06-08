import 'package:flutter/material.dart';

Widget futureBody<T>(
    AsyncSnapshot<T> snapshot,
    Widget Function(T data) builder,
) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          Text(
            'Loading...',
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
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'Something went wrong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              '${snapshot.error}',
              style: const TextStyle(fontSize: 16),
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

  return const Center(
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
          'No data available',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}