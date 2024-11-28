import 'package:uaizu_app/domain/entity/book.dart';

abstract class BookRepository {
  Future<Book> fetchBookDetail(String path);

  Future<BookSearchResult> fetchBookSearchResult(BookSearchQuery query);

  Future<String?> fetchBookImageUrl(Book book);

  Future<List<Book>> fetchNewBooks();
}
