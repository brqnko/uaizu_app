import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/usecase/library_usecase.dart';

final newBooksProvider =
    AsyncNotifierProvider<NewBooksNotifier, List<Book>>(() {
  return NewBooksNotifier();
});

class NewBooksNotifier extends AsyncNotifier<List<Book>> {
  @override
  FutureOr<List<Book>> build() {
    return ref.watch(getNewBooksUseCaseProvider).call(());
  }

  Future<void> requestReload() {
    return update((prev) async {
      final books = await ref.watch(getNewBooksUseCaseProvider).call(());
      print(books);
      return books;
    });
  }
}
