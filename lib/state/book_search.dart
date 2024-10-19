import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/usecase/library_usecase.dart';

const _maxCountPerSearch = 20;

final bookSearchQueryProvider = StateProvider((ref) => '');

final bookSearchResultProvider =
    AsyncNotifierProvider<BookSearchResultNotifier, BookSearchResult>(
  () {
    return BookSearchResultNotifier();
  },
);

class BookSearchResultNotifier extends AsyncNotifier<BookSearchResult> {
  bool _isLoading = false;
  int _currentPage = 1;

  @override
  FutureOr<BookSearchResult> build() {
    return const BookSearchResult(books: [], hasNext: false);
  }

  Future<void> requestFirstSearch() async {
    _isLoading = false;
    _currentPage = 1;

    final result = await _fetchSearchWIthCurrentState();

    state = AsyncValue.data(result);
  }

  Future<void> requestMoreResult() {
    if (_isLoading) {
      return Future(() => {});
    }

    return update((prev) async {
      final prevBooks = <Book>[...prev.books];

      final current = await _fetchSearchWIthCurrentState();

      prevBooks.addAll(current.books);

      return current.copyWith(
        books: prevBooks,
      );
    });
  }

  Future<BookSearchResult> _fetchSearchWIthCurrentState() async {
    _isLoading = true;
    final query = ref.watch(bookSearchQueryProvider);

    final result = await ref.watch(getBookSearchResultUseCaseProvider).call(
          GetBookSearchResultUseCaseParam(
            query: BookSearchQuery(
              query: query,
              mode: BookSearchMode.normal,
              order: BookSearchOrder.recommended_d,
              start: _currentPage,
              count: _maxCountPerSearch,
            ),
          ),
        );

    _currentPage += _maxCountPerSearch;
    _isLoading = false;

    return result;
  }
}
