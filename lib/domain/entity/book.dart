import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String path,
    String? title,
    String? imageUrl,
    String? author,
    String? publisher,
    String? location,
    String? callMark,
    String? material,
    String? publication,
    String? form,
    String? alternative,
    String? countryOfPublication,
    String? titleLanguage,
    String? languageOfTexts,
    String? languageOfOriginal,
    String? isbn,
    String? ncid,
  }) = _Book;
}

@freezed
class BookSearchResult with _$BookSearchResult {
  const factory BookSearchResult({
    required List<Book> books,
    required bool hasNext,
  }) = _BookSearchResult;
}

enum BookSearchOrder {
  recommended,
  yearFromNewest,
  yearFromOldest,
  arrivalDateFromNewest,
  titleFromA,
  titleFromZ,
  authorFromA,
  authorFromZ,
  lendingCount,
  relevance,
}

enum BookSearchMode { normal }

@freezed
class BookSearchQuery with _$BookSearchQuery {
  const factory BookSearchQuery({
    required String query,
    required BookSearchMode mode,
    required BookSearchOrder order,
    required int start,
    required int count,
  }) = _BookSearchQuery;
}
