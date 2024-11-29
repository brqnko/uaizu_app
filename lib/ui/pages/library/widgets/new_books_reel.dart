import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/use_case/library_usecase.dart';

class NewBooksReel extends HookConsumerWidget {
  const NewBooksReel({super.key});

  Widget _buildBookCover(
    Book book,
    ColorScheme colorScheme,
    WidgetRef ref,
    BuildContext context,
  ) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 5,
        ),
      ],
    );

    final bookImage = book.imageUrl == null
        ? Center(
            child: Icon(
              Icons.book,
              size: 50,
              color: colorScheme.secondary,
            ),
          )
        : Image.network(
            book.imageUrl!,
            fit: BoxFit.cover,
          );

    final container = InkWell(
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.all(8),
        decoration: decoration,
        child: bookImage,
      ),
      onTap: () {
        context.push('/library/book/${Uri.encodeComponent(book.path)}');
      },
    );

    return Column(
      children: [
        container,
        if (book.title != null)
          SizedBox(
            width: 150,
            child: Text(
              book.title!,
              overflow: TextOverflow.ellipsis,
              style: Fonts.titleS
                ..copyWith(color: colorScheme.onSurfaceVariant),
              maxLines: 2,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorScheme = Theme.of(context).colorScheme;

    final booksFuture = useMemoized(() {
      return ref.watch(getNewBooksUseCaseProvider).call(());
    });

    final books = useFuture(booksFuture);

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.hasData ? books.data!.length : 10,
        itemBuilder: (_, index) {
          if (books.hasData) {
            return _buildBookCover(books.data![index], colorScheme, ref, context);
          } else {
            return Container(
              width: 150,
              height: 200,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
