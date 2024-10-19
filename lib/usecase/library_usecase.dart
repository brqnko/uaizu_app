import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/domain/provider/book_repository_provider.dart';
import 'package:uaizu_app/domain/provider/calendar_repository_provider.dart';
import 'package:uaizu_app/domain/repository/book_repository.dart';
import 'package:uaizu_app/domain/repository/calendar_repository.dart';
import 'package:uaizu_app/usecase/usecase.dart';

part 'library_usecase.freezed.dart';

final getBookSearchResultUseCaseProvider = Provider((ref) {
  return GetBookSearchResultUseCase(ref.watch(bookRepositoryProvider));
});

final getNewBooksUseCaseProvider = Provider((ref) {
  return GetNewBooksUseCase(ref.watch(bookRepositoryProvider));
});

final getBookDetailUseCaseProvider = Provider((ref) {
  return GetBookDetailUseCase(ref.watch(bookRepositoryProvider));
});

final getLibraryCalendarUseCaseProvider = Provider((ref) {
  return GetLibraryCalenderUseCase(ref.watch(calendarRepositoryProvider));
});

final getBookImageUseCaseProvider = Provider((ref) {
  return GetBookImageUseCase(ref.watch(bookRepositoryProvider));
});

@freezed
class GetBookImageUseCaseParam with _$GetBookImageUseCaseParam {
  const factory GetBookImageUseCaseParam({
    required Book book,
  }) = _GetBookImageUseCaseParam;
}

class GetBookImageUseCase
    extends UseCase<GetBookImageUseCaseParam, Future<String?>> {
  GetBookImageUseCase(this._repository);

  final BookRepository _repository;

  @override
  Future<String?> call(GetBookImageUseCaseParam param) {
    return _repository.fetchBookImageUrl(param.book);
  }
}

@freezed
class GetBookSearchResultUseCaseParam with _$GetBookSearchResultUseCaseParam {
  const factory GetBookSearchResultUseCaseParam({
    required BookSearchQuery query,
  }) = _GetBookSearchResultUseCaseParam;
}

class GetBookSearchResultUseCase
    extends UseCase<GetBookSearchResultUseCaseParam, Future<BookSearchResult>> {
  GetBookSearchResultUseCase(this._repository);

  final BookRepository _repository;

  @override
  Future<BookSearchResult> call(GetBookSearchResultUseCaseParam param) async {
    final result = await _repository.fetchBookSearchResult(param.query);

    return result;
  }
}

class GetNewBooksUseCase extends UseCase<void, Future<List<Book>>> {
  GetNewBooksUseCase(this._repository);

  final BookRepository _repository;

  @override
  Future<List<Book>> call(void param) async {
    final books = await _repository.fetchNewBooks();

    return books;
  }
}

@freezed
class GetBookDetailUseCaseParam with _$GetBookDetailUseCaseParam {
  const factory GetBookDetailUseCaseParam({
    required Book book,
  }) = _GetBookDetailUseCaseParam;
}

class GetBookDetailUseCase
    extends UseCase<GetBookDetailUseCaseParam, Future<Book>> {
  GetBookDetailUseCase(this._repository);

  final BookRepository _repository;

  @override
  Future<Book> call(GetBookDetailUseCaseParam param) async {
    final detail = await _repository.fetchBookDetail(param.book);

    return detail;
  }
}

@freezed
class GetLibraryCalenderUseCaseParam with _$GetLibraryCalenderUseCaseParam {
  const factory GetLibraryCalenderUseCaseParam({
    required LibraryCalenderQuery query,
  }) = _GetLibraryCalenderUseCaseParam;
}

class GetLibraryCalenderUseCase extends UseCase<GetLibraryCalenderUseCaseParam,
    Future<LibraryCalendarEntire>> {
  GetLibraryCalenderUseCase(this._repository);

  final CalendarRepository _repository;

  @override
  Future<LibraryCalendarEntire> call(
      GetLibraryCalenderUseCaseParam param) async {
    final calender = await _repository.fetchLibraryCalendarMonth(param.query);

    return LibraryCalendarEntire(
      calender: {
        calender.month: calender,
      },
    );
  }
}
