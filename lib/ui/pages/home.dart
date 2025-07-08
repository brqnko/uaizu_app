import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      backgroundColor: colorScheme.primary,
      selectedItemColor: colorScheme.onPrimaryFixed,
      unselectedItemColor: colorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_month),
          label: l10n.square,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.edit),
          label: l10n.moodle,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.book),
          label: l10n.library,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications_sharp),
          label: l10n.notifications,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: l10n.account,
        ),
      ],
      onTap: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
    );

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        child: bottomNavigationBar,
      ),
    );
  }
}
