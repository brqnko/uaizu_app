import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/infrastructure/client/library_client.dart';

const _authority = 'libopsv.u-aizu.ac.jp';

extension on BookSearchOrder {
  String get query {
    switch (this) {
      case BookSearchOrder.recommended:
        return 'recommended_d';
      case BookSearchOrder.yearFromNewest:
        return 'year_d';
      case BookSearchOrder.yearFromOldest:
        return 'year_a';
      case BookSearchOrder.titleFromA:
        return 'title_a';
      case BookSearchOrder.titleFromZ:
        return 'title_d';
      case BookSearchOrder.arrivalDateFromNewest:
        return 'arrival_date_d';
      case BookSearchOrder.authorFromA:
        return 'author_a';
      case BookSearchOrder.authorFromZ:
        return 'author_d';
      case BookSearchOrder.lendingCount:
        return 'lending_count_d';
      case BookSearchOrder.relevance:
        return 'rank_d';
    }
  }
}

class BookDataSource {
  BookDataSource(
    this._client,
  );

  final LibraryClient _client;

  Future<List<Book>> fetchNewBooks() async {
    final res = await _client.get(
      Uri.https(
        _authority,
        '/cgi-bin/limedio/portal/carousel/new_arrival',
        {
          'locale': 'en',
          'theme': 'cyan',
        },
      ),
    );

    return _parseNewBooksFromBody(res.body);
  }

  /// Fetch book search result
  ///
  /// [query] is the search query
  Future<BookSearchResult> fetchBookSearchResult(BookSearchQuery query) async {
    assert(query.start > 0);
    assert(query.count > 0);

    // Encode the query to be used in the URL
    final decodedQuery = Uri.encodeQueryComponent(query.query);

    // FIXME: Avoid the too long string literal
    // Uri.https encodes $_baseUrl, which makes this not working
    final res = await _client.get(
      Uri.parse(
        'https://$_authority/opac/crosssearch?base_url=https://$_authority&count=${query.count}&displaylang=${_client.locale.libraryLocale}&locale=${_client.locale.libraryLocale}&order=${query.order.query}&q=$decodedQuery&searchmode=normal&start=${query.start}&target=local',
      ),
    );

    return _parseSearchResultFromBody(res.body, query.count);
  }

  Book? _parseBookFromElement(Element element) {
    final title = element.querySelector('h3 a')?.text;
    final author =
        element.querySelector('.l_detail_info_au_book dd span')?.text;
    final publisher = element.querySelector('.l_detail_info_pu dd span')?.text;
    final isbn = element.querySelector('.l_detail_info_sb dd span')?.text;
    final holdings = element.querySelector('.l_detail_info_hd dd span')?.text;
    final referenceUrl = element.querySelector('h3 a')?.attributes['href'];

    if (referenceUrl == null) {
      return null;
    }

    return Book(
      title: title,
      author: author,
      publisher: publisher,
      isbn: isbn,
      location: holdings,
      path: referenceUrl,
    );
  }

  BookSearchResult _parseSearchResultFromBody(String responseBody, int count) {
    const htmlStart = '\$("#lid_SearchResultList_local").html("';
    const htmlEnd = '");';

    // Find the HTML line that contains the search result.
    final htmlLine = responseBody
        .split('\n')
        .firstWhere((line) => line.startsWith(htmlStart));

    // Extract the HTML from the line.
    final html = htmlLine
        .substring(htmlStart.length, htmlLine.length - htmlEnd.length)
        .replaceAll('\\n', '')
        .replaceAll('\\"', '"')
        .replaceAll('\\/', '/')
        .replaceAll('\\\'', '\'');

    final books = parse(html)
        .querySelectorAll('.panel.searchCard')
        .map(_parseBookFromElement)
        .whereType<Book>()
        .toList();

    final hasNext = count == books.length;

    return BookSearchResult(
      books: books,
      hasNext: hasNext,
    );
  }

  Book? _parseNewBookFromElement(Element element) {
    var imageUrl = element
        .querySelector('img.c_panel_slider_thumbnail_img')
        ?.attributes['data-lazy'];
    if (imageUrl == null || !imageUrl.startsWith('https://')) {
      imageUrl = null;
    }

    final title = element.querySelector('div > a > h3')?.text;
    final path = element
        .querySelector('a.c_panel_slider_thumbnail_link')
        ?.attributes['href'];

    if (path == null) {
      return null;
    }

    return Book(
      title: title,
      imageUrl: imageUrl,
      path: path,
    );
  }

  List<Book> _parseNewBooksFromBody(String responseBody) {
    return parse(responseBody)
        .querySelectorAll('.panel.c_panel_slider_thumbnail')
        .map(_parseNewBookFromElement)
        .whereType<Book>()
        .toList();
  }

  Future<String?> fetchBookImage(Book book) async {
    if (book.isbn == null) {
      return null;
    }

    final response = await _client.get(
      Uri.parse('https://www.kinokuniya.co.jp/f/dsg-01-${book.isbn!}'),
    );

    return _parseImageFromBody(response.body);
  }

  String? _parseImageFromBody(String responseBody) {
    return parse(responseBody)
        .querySelector('meta[property="og:image"]')
        ?.attributes['content'];
  }

  Future<Book> fetchBookDetail(Book book) async {
    assert(book.path.startsWith('/opac/'));

    final response = await _client.get(
      Uri.parse('https://$_authority${book.path}'),
    );

    return _parseBookDetailFromBody(response.body, book);
  }

  Book _parseBookDetailFromBody(String responseBody, Book beforeBook) {
    final document = parse(responseBody);

    final title = document.querySelector('#lid_intro_major_title')?.text.trim();
    final author = document.querySelector('#lid_intro_lead_au')?.text.trim();
    final publisher = document.querySelector('#lid_intro_lead_pu')?.text.trim();
    final location =
        document.querySelector('td.volume_lo.l_volume_td_lo p')?.text.trim();
    final callMark = document
        .querySelector('div.c_default_square_seal ul')
        ?.querySelectorAll('li')
        .where((element) => element.text.isNotEmpty)
        .map((e) => e.text.trim())
        .join();
    final material =
        document.querySelector('td.volume_ba.l_volume_td_ba p')?.text.trim();

    String? publication;
    String? form;
    String? alternative;
    String? countryOfPublication;
    String? titleLanguage;
    String? languageOfTexts;
    String? languageOfOriginal;
    String? isbn;
    String? ncid;

    final dlElements = document.querySelectorAll('dl');
    final mapping = _mapping[_client.locale]!;

    for (final dl in dlElements) {
      final dt = dl.querySelector('dt')?.text.trim();
      final dd = dl.querySelector('dd')?.text.trim();

      // FIXME: if if if rush!!!!!!!!!!!!!!!!!!
      if (dt == mapping.publication) {
        publication = dd;
      } else if (dt == mapping.form) {
        form = dd;
      } else if (dt == mapping.alternative) {
        alternative = dd;
      } else if (dt == mapping.countryOfPublication) {
        countryOfPublication = dd;
      } else if (dt == mapping.titleLanguage) {
        titleLanguage = dd;
      } else if (dt == mapping.languageOfTexts) {
        languageOfTexts = dd;
      } else if (dt == mapping.languageOfOriginal) {
        languageOfOriginal = dd;
      } else if (dt == mapping.isbn) {
        isbn = dd;
      } else if (dt == mapping.ncid) {
        ncid = dd;
      }
    }

    return beforeBook.copyWith(
      title: title,
      author: author,
      publisher: publisher,
      location: location,
      callMark: callMark,
      material: material,
      publication: publication,
      form: form,
      alternative: alternative,
      countryOfPublication: countryOfPublication,
      titleLanguage: titleLanguage,
      languageOfTexts: languageOfTexts,
      languageOfOriginal: languageOfOriginal,
      isbn: isbn,
      ncid: ncid,
    );
  }
}

class _Mapping {
  const _Mapping({
    required this.publication,
    required this.form,
    required this.alternative,
    required this.countryOfPublication,
    required this.titleLanguage,
    required this.languageOfTexts,
    required this.languageOfOriginal,
    required this.isbn,
    required this.ncid,
  });

  final String publication;
  final String form;
  final String alternative;
  final String countryOfPublication;
  final String titleLanguage;
  final String languageOfTexts;
  final String languageOfOriginal;
  final String isbn;
  final String ncid;
}

const _mapping = {
  AppLocale.en: _Mapping(
    publication: 'Publication',
    form: 'Form',
    alternative: 'Alternative',
    countryOfPublication: 'Country of publication',
    titleLanguage: 'Title language',
    languageOfTexts: 'Language of texts',
    languageOfOriginal: 'Language of original',
    isbn: 'ISBN',
    ncid: 'NCID',
  ),
  AppLocale.ja: _Mapping(
    publication: '刊年',
    form: '形態',
    alternative: '別書名',
    countryOfPublication: '出版国',
    titleLanguage: '標題言語',
    languageOfTexts: '本文言語',
    languageOfOriginal: '原作言語',
    isbn: 'ISBN',
    ncid: 'NCID',
  ),
};
