import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/ui/pages/library/widgets/library_calendar.dart';
import 'package:uaizu_app/ui/pages/library/widgets/new_books_reel.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/search/search_bar.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final appBar = brandAppBar(
      context,
      child: const LibrarySearchBar(),
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
