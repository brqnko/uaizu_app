// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/domain/entity/library_calendar.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';
import 'package:uaizu_app/infrastructure/client/library_client.dart';
import 'package:uaizu_app/infrastructure/data_source/book_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/library_calendar_data_source.dart';

void main() {
  group('library client ja', () {
    final libraryClient = LibraryClient(
      AppHttpClient(Client()),
      AppLocale.ja,
    );

    test('fetch library calender', () async {
      final calender = await LibraryCalendarDataSource(libraryClient)
          .fetchCalendar(
        LibraryCalenderQuery(
          time: DateTime.now(),
          isFourYear: true,
        ),
      );

      calender.calender.values.forEach(print);
    });

    test('fetch new books', () async {
      final newBooks = await BookDataSource(libraryClient).fetchNewBooks();

      newBooks.forEach(print);
    });

    test('fetch book search result', () async {
      final result = await BookDataSource(libraryClient)
          .fetchBookSearchResult(
        const BookSearchQuery(
          query: 'Rust',
          mode: BookSearchMode.normal,
          order: BookSearchOrder.recommended,
          start: 1,
          count: 5,
        ),
      );

      result.books.forEach(print);
    });

    test('fetch book image', () async {
      final imageUrl = await BookDataSource(libraryClient).fetchBookImage(
        const Book(
          path: '',
          isbn: '9784814400584',
        ),
      );

      print(imageUrl);
    });

    test('fetch book detail', () async {

      final detail = await BookDataSource(libraryClient).fetchBookDetail(
        '/opac/volume/403829?current=1&q=Rust&total=124&trans_url=%2Fopac%2Fsearch%3Fbase_url%3Dhttps%253A%252F%252Flibopsv.u-aizu.ac.jp%26count%3D20%26defaultpage%3D1%26defaulttarget%3Dlocal%26order%3Drecommended_d%26q%3DRust%26searchmode%3Dnormal',
      );

      print(detail);
    });
  });
}
