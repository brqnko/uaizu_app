import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/domain/repository/book_repository.dart';
import 'package:uaizu_app/infrastructure/data_source/book_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl(this._dataSource);

  final BookDataSource _dataSource;

  @override
  Future<Book> fetchBookDetail(String path) {
    return _dataSource.fetchBookDetail(path);
  }

  @override
  Future<String?> fetchBookImageUrl(Book book) {
    return _dataSource.fetchBookImage(book);
  }

  @override
  Future<BookSearchResult> fetchBookSearchResult(BookSearchQuery query) {
    return _dataSource.fetchBookSearchResult(query);
  }

  @override
  Future<List<Book>> fetchNewBooks() {
    return _dataSource.fetchNewBooks();
  }
}
