import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/use_case/library_usecase.dart';

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

  Future<void> requestFirstSearch(String query, BookSearchOrder order) async {
    _isLoading = false;
    _currentPage = 1;

    final result = await _fetchSearchWIthCurrentState(query, order);

    state = AsyncValue.data(result);
  }

  Future<void> requestMoreResult(String query, BookSearchOrder order) {
    if (_isLoading) {
      return Future(() => {});
    }

    _isLoading = true;

    return update((prev) async {
      final prevBooks = <Book>[...prev.books];

      final current = await _fetchSearchWIthCurrentState(query, order);

      prevBooks.addAll(current.books);

      return current.copyWith(
        books: prevBooks,
      );
    });
  }

  Future<BookSearchResult> _fetchSearchWIthCurrentState(
    String query,
    BookSearchOrder order,
  ) async {
    _isLoading = true;

    final result = await ref.watch(getBookSearchResultUseCaseProvider).call(
          GetBookSearchResultUseCaseParam(
            query: BookSearchQuery(
              query: query,
              mode: BookSearchMode.normal,
              order: order,
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
