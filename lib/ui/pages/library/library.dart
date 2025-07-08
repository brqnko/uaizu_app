import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/book_search.dart';
import 'package:uaizu_app/ui/pages/library/widgets/library_calendar.dart';
import 'package:uaizu_app/ui/pages/library/widgets/new_books_reel.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final appBar = brandAppBar(
      context,
      child: SizedBox(
        height: 35,
        child: TextFormField(
          decoration: InputDecoration(
            isDense: true,
            hintText: l10n.search,
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
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TaggedWidget(
                tag: l10n.newBooks,
                child: const NewBooksReel(),
              ),
              const SizedBox(height: 16),
              const LibraryCalendar(),
            ],
          ),
        ),
      ),
    );
  }
}
