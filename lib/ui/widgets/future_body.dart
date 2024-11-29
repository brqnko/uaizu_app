import 'package:flutter/material.dart';

Widget futureBody<T>(
  AsyncSnapshot<T> snapshot,
  Widget Function(T data) builder,
) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  if (snapshot.hasError) {
    return Center(
      child: Text('Error: ${snapshot.error}'),
    );
  }

  if (snapshot.hasData) {
    return builder(snapshot.data as T);
  }

  return const Center(
    child: Text('No data'),
  );
}
