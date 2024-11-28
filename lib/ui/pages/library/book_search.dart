import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/state/book_image.dart';
import 'package:uaizu_app/state/book_search.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

Widget _buildBookTile(
    Book book,
    ColorScheme colorScheme,
    BuildContext context,
    WidgetRef ref,
) {

  ref.read(bookImageProvider.notifier).updateRequest(book);

  return Padding(
    padding: const EdgeInsets.all(12),
    child: InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 130,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: ref.watch(bookImageProvider).when(
                data: (data) {
                  if (data.containsKey(book)) {
                    if (data[book] != null) {
                      return Image.network(
                        data[book]!,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const Icon(Icons.question_mark_outlined);
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
                loading: () => const CircularProgressIndicator(),
                error: (err, stack) => Text(err.toString()),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (book.title != null)
                    Text(
                      book.title!,
                      overflow: TextOverflow.ellipsis,
                      style:
                      Fonts.titleM.copyWith(color: colorScheme.onSurface),
                      maxLines: 2,
                    ),
                  if (book.author != null)
                    Text(
                      book.author!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT
                          .copyWith(color: colorScheme.onSurfaceVariant),
                      maxLines: 1,
                    ),
                  if (book.publisher != null)
                    Text(
                      book.publisher!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT
                          .copyWith(color: colorScheme.onSurfaceVariant),
                      maxLines: 1,
                    ),
                  if (book.location != null)
                    Text(
                      book.location!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT
                          .copyWith(color: colorScheme.onSurfaceVariant),
                      maxLines: 1,
                    ),
                  if (book.isbn != null)
                    Text(
                      book.isbn!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT
                          .copyWith(color: colorScheme.onSurfaceVariant),
                      maxLines: 1,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        context.push('/library/book/${Uri.encodeComponent(book.path)}');
      },
    ),
  );
}

class BookSearchPage extends HookConsumerWidget {
  const BookSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorScheme = Theme.of(context).colorScheme;

    final order = useState(BookSearchOrder.recommended);

    useEffect(() {
      
      ref.read(bookSearchResultProvider.notifier).requestFirstSearch(
        ref.read(bookSearchQueryProvider),
        order.value,
      );
      
      return null;
    }, [ ref.read(bookSearchQueryProvider), order.value ],);

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      iconTheme: IconThemeData(color: colorScheme.secondary),
      title: Center(
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
              context.push('/library/search');
            },
          ),
        ),
      ),
    );

    final bookSearchResult = ref.watch(bookSearchResultProvider).when(
      data: (value) => NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent && value.hasNext) {
            ref.read(bookSearchResultProvider.notifier).requestMoreResult(ref.read(bookSearchQueryProvider), order.value);
          }
          return false;
        },
        child: ListView.builder(
          itemCount:
          value.hasNext ? value.books.length + 1 : value.books.length,
          itemBuilder: (context, index) {
            if (index == value.books.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return _buildBookTile(
              value.books[index],
              colorScheme,
              context,
              ref,
            );
          },
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          'エラーが発生しました: $error',
          style: Fonts.bodyM.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 55,
            backgroundColor: colorScheme.onPrimaryContainer,
            title: SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: DropdownButton(
                      value: order.value,
                      onChanged: (value) {

                        if (value == null) {
                          return;
                        }

                        order.value = value;
                        print('order.value: ${order.value}');
                      },
                      items: BookSearchOrder.values.map((q) {
                        return DropdownMenuItem(
                          value: q,
                          child: Text(
                            q.name,
                            style: Fonts.bodyS
                                .copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: bookSearchResult),
        ],
      ),
    );
  }
}
