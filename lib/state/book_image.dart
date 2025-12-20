import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/domain/provider/book_repository_provider.dart';

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
      final imageUrl =
          await ref.watch(bookRepositoryProvider).fetchBookImageUrl(book);

      state.requireValue[book] = imageUrl;
      return state.requireValue;
    });
  }
}
