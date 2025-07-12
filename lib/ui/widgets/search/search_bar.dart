import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/book_search.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({
    this.hintText,
    this.onSubmitted,
    this.searchRoutePath,
    this.searchProvider,
    super.key,
  });

  final String? hintText;
  final void Function(String)? onSubmitted;
  final String? searchRoutePath;
  final StateProvider<String>? searchProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: 35,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText ?? l10n.search,
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
          if (onSubmitted != null) {
            onSubmitted!(value);
          } else if (searchProvider != null && searchRoutePath != null) {
            ref.read(searchProvider!.notifier).state = value;
            context.push(searchRoutePath!);
          }
        },
      ),
    );
  }
}

class LibrarySearchBar extends ConsumerWidget {
  const LibrarySearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchBar(
      searchProvider: bookSearchQueryProvider,
      searchRoutePath: '/library/search',
    );
  }
}
