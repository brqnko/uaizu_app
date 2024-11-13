import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/use_case/library_usecase.dart';

final bookImageProvider =
    AsyncNotifierProvider<BookImageNotifier, Map<Book, String?>>(() {
  return BookImageNotifier();
});

class BookImageNotifier extends AsyncNotifier<Map<Book, String?>> {
  @override
  FutureOr<Map<Book, String?>> build() {
    return {};
  }

  Future<void> updateRequest(Book book) async {
    if (state.requireValue.containsKey(book)) {
      return;
    }

    await update((prev) async {
      final imageUrl = await ref.watch(getBookImageUseCaseProvider).call(
            GetBookImageUseCaseParam(
              book: book,
            ),
          );

      state.requireValue[book] = imageUrl;
      return state.requireValue;
    });
  }
}
