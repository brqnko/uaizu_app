import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/state/book_image.dart';
import 'package:uaizu_app/state/book_search.dart';
import 'package:uaizu_app/ui/pages/library/widgets/search_result_book.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/dropdown_button.dart';

class BookSearchPage extends HookConsumerWidget {
  const BookSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final orderIndex = useState(0);

    useEffect(
      () {
        ref.read(bookSearchResultProvider.notifier).requestFirstSearch(
              ref.read(bookSearchQueryProvider),
              BookSearchOrder.values[orderIndex.value],
            );

        return null;
      },
      [ref.read(bookSearchQueryProvider), orderIndex.value],
    );

    final appBar = brandAppBar(
      context,
      child: SizedBox(
        height: 35,
        child: TextFormField(
          initialValue: ref.read(bookSearchQueryProvider),
          decoration: InputDecoration(
            isDense: true,
            hintText: '検索',
            hintStyle: Fonts.bodyS.copyWith(color: colorScheme.primary),
            prefixIcon: Icon(
              Icons.search,
              color: colorScheme.primary,
            ),
            filled: true,
            fillColor: colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          onFieldSubmitted: (value) {
            ref.read(bookSearchQueryProvider.notifier).state = value;
          },
        ),
      ),
    );

    final bookSearchResult = ref.watch(bookSearchResultProvider).when(
          data: (value) => NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  value.hasNext) {
                ref.read(bookSearchResultProvider.notifier).requestMoreResult(
                      ref.read(bookSearchQueryProvider),
                      BookSearchOrder.values[orderIndex.value],
                    );
              }
              return false;
            },
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              padding: const EdgeInsets.all(16),
              itemCount:
                  value.hasNext ? value.books.length + 1 : value.books.length,
              itemBuilder: (context, index) {
                if (index == value.books.length) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final book = value.books[index];

                ref.read(bookImageProvider.notifier).updateRequest(book);

                return SearchResultBook(book: book);
              },
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) =>
              Center(child: Text('エラーが発生しました: $error')),
        );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: Column(
        children: [
          brandAppBarWithOptions(
            context,
            [
              ElevatedButton(
                onPressed: () {},
                child: BrandDropdownButton(
                  index: orderIndex,
                  values: BookSearchOrder.values.map((e) => e.name).toList(),
                ),
              ),
            ],
          ),
          Expanded(child: bookSearchResult),
        ],
      ),
    );
  }
}
