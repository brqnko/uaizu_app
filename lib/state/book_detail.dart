import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/usecase/library_usecase.dart';

final focusedBookProvider = StateProvider<Book?>((ref) => null);

final bookDetailProvider = AsyncNotifierProvider<BookDetailNotifier, Book?>(() {
  return BookDetailNotifier();
});

class BookDetailNotifier extends AsyncNotifier<Book?> {
  @override
  FutureOr<Book?> build() {
    return Future.value();
  }

  Future<void> updateBook() {
    return update((prev) async {
      final focusedBook = ref.watch(focusedBookProvider);
      if (focusedBook == null) {
        return null;
      }

      final detail = await ref.watch(getBookDetailUseCaseProvider).call(
            GetBookDetailUseCaseParam(
              book: focusedBook,
            ),
          );

      print(detail);
      return detail;
    });
  }
}
