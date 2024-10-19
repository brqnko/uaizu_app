import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/state/book_detail.dart';
import 'package:uaizu_app/state/new_books.dart';
import 'package:uaizu_app/ui/pages/library/book_detail.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class NewBooksReel extends ConsumerWidget {
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
        ref.read(focusedBookProvider.notifier).state = book;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookDetailPage()),
        );
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
    final books = ref.watch(newBooksProvider);

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.maybeWhen(
          data: (books) => books.length,
          orElse: () => 10,
        ),
        itemBuilder: (_, index) {
          return books.when(
            data: (books) {
              return _buildBookCover(books[index], colorScheme, ref, context);
            },
            loading: () => Container(
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
            ),
            error: (error, stackTrace) => Text('Error: $stackTrace'),
          );
        },
      ),
    );
  }
}
