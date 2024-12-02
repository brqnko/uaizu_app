import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/state/book_image.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';

class SearchResultBook extends ConsumerWidget {
  const SearchResultBook({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      child: HorizontalExpandedContainer(
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
                          return const Icon(
                            Icons.question_mark_outlined,
                          );
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
                      style: Fonts.bodyT.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                    ),
                  if (book.publisher != null)
                    Text(
                      book.publisher!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                    ),
                  if (book.location != null)
                    Text(
                      book.location!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                    ),
                  if (book.isbn != null)
                    Text(
                      book.isbn!,
                      overflow: TextOverflow.ellipsis,
                      style: Fonts.bodyT.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        context.push(
          '/library/book/${Uri.encodeComponent(book.path)}',
        );
      },
    );
  }
}
