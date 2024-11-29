import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/state/book_search.dart';
import 'package:uaizu_app/ui/pages/library/widgets/library_calendar.dart';
import 'package:uaizu_app/ui/pages/library/widgets/new_books_reel.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      iconTheme: IconThemeData(color: colorScheme.secondary),
      title: Center(
        child: SizedBox(
          height: 35,
          child: TextFormField(
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

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '新着図書',
                  style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                ),
              ),
              const SizedBox(height: 8),
              const NewBooksReel(),
              const SizedBox(height: 32),
              const LibraryCalendar(),
            ],
          ),
        ),
      ),
    );
  }
}
