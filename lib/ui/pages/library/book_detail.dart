import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/book.dart';
import 'package:uaizu_app/state/book_image.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/use_case/library_usecase.dart';

Widget _buildBookImage(Book book, WidgetRef ref) {
  ref.read(bookImageProvider.notifier).updateRequest(book);
  final imageUrl = ref.watch(bookImageProvider);
  return imageUrl.when(
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
    error: (error, stackTrace) {
      return Text('Error: $error');
    },
  );
}

Widget _buildTaggedText(String tag, String text, ColorScheme colorScheme) {
  return Row(
    children: [
      Text(
        '$tag: ',
        style: Fonts.titleS.copyWith(
          color: colorScheme.onSurface,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      Expanded(
        child: Text(
          text,
          style: Fonts.bodyS.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget _buildBookBody(
  Book? bookDetail,
  ColorScheme colorScheme,
  WidgetRef ref,
) {
  if (bookDetail == null) {
    return const CircularProgressIndicator();
  }

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (bookDetail.title != null)
            Text(
              bookDetail.title!,
              style: Fonts.titleL.copyWith(color: colorScheme.onSurface),
            ),
          const SizedBox(height: 16),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.onPrimary.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: _buildBookImage(bookDetail, ref),
          ),
          const SizedBox(height: 16),
          if (bookDetail.author != null)
            _buildTaggedText(
              'Author',
              bookDetail.author!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.publisher != null)
            _buildTaggedText(
              'Publisher',
              bookDetail.publisher!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.publication != null)
            _buildTaggedText(
              'Published Date',
              bookDetail.publication!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.location != null)
            _buildTaggedText(
              'Location',
              bookDetail.location!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.isbn != null)
            _buildTaggedText(
              'ISBN',
              bookDetail.isbn!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.alternative != null)
            _buildTaggedText(
              'Alternative',
              bookDetail.alternative!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.callMark != null)
            _buildTaggedText(
              'Call Mark',
              bookDetail.callMark!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.countryOfPublication != null)
            _buildTaggedText(
              'Country of Publication',
              bookDetail.countryOfPublication!,
              colorScheme,
            ),
          const SizedBox(height: 8),
          if (bookDetail.form != null)
            _buildTaggedText(
              'Format',
              bookDetail.form!,
              colorScheme,
            ),
        ],
      ),
    ),
  );
}

class BookDetailPage extends HookConsumerWidget {
  const BookDetailPage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final bookDetailFuture = useMemoized(() {
      return ref.watch(getBookDetailUseCaseProvider).call(
            GetBookDetailUseCaseParam(bookPath: path),
          );
    });
    final bookDetail = useFuture(bookDetailFuture);

    final body = bookDetail.connectionState == ConnectionState.done
        ? _buildBookBody(bookDetail.data, colorScheme, ref)
        : const Center(child: CircularProgressIndicator());

    final appBar = AppBar(
      iconTheme: IconThemeData(color: colorScheme.onPrimaryFixed),
      backgroundColor: colorScheme.primary,
      title: Text(
        'Book Detail',
        style: Fonts.titleM.copyWith(
          color: colorScheme.onPrimaryFixed,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: body,
    );
  }
}
