import 'package:flutter/foundation.dart';
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

    final destinations = _HomeDestination.values(l10n);

    void onDestinationSelected(int index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }

    final mediaQuery = MediaQuery.of(context);
    final isDesktopLayout = mediaQuery.size.width >= 900 ||
        (!kIsWeb &&
            {
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            }.contains(defaultTargetPlatform));

    if (isDesktopLayout) {
      return _DesktopHomeScaffold(
        navigationShell: navigationShell,
        destinations: destinations,
        onDestinationSelected: onDestinationSelected,
      );
    }

    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      backgroundColor: colorScheme.primary,
      selectedItemColor: colorScheme.onPrimaryFixed,
      unselectedItemColor: colorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      items: destinations
          .map(
            (destination) => BottomNavigationBarItem(
              icon: Icon(destination.icon),
              label: destination.label,
            ),
          )
          .toList(),
      onTap: onDestinationSelected,
    );

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        child: bottomNavigationBar,
      ),
    );
  }
}

class _DesktopHomeScaffold extends StatelessWidget {
  const _DesktopHomeScaffold({
    required this.navigationShell,
    required this.destinations,
    required this.onDestinationSelected,
  });

  final StatefulNavigationShell navigationShell;
  final List<_HomeDestination> destinations;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);
    final extendedRail = mediaQuery.size.width >= 1200;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: extendedRail ? 280 : 96,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.24),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: extendedRail ? 24 : 16,
                      vertical: 24,
                    ),
                    child: Text(
                      l10n.appTitle,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colorScheme.onPrimaryFixed,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  Expanded(
                    child: NavigationRail(
                      selectedIndex: navigationShell.currentIndex,
                      extended: extendedRail,
                      backgroundColor: Colors.transparent,
                      indicatorColor:
                          colorScheme.onPrimary.withValues(alpha: 0.18),
                      useIndicator: true,
                      selectedIconTheme: IconThemeData(
                        color: colorScheme.onPrimaryFixed,
                        size: 28,
                      ),
                      unselectedIconTheme: IconThemeData(
                        color: colorScheme.onPrimary.withValues(alpha: 0.8),
                        size: 24,
                      ),
                      selectedLabelTextStyle:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimaryFixed,
                                fontWeight: FontWeight.w600,
                              ),
                      unselectedLabelTextStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            color: colorScheme.onPrimary.withValues(alpha: 0.8),
                          ),
                      destinations: [
                        for (final destination in destinations)
                          NavigationRailDestination(
                            icon: Icon(destination.icon),
                            selectedIcon: Icon(destination.icon),
                            label: Text(destination.label),
                          ),
                      ],
                      onDestinationSelected: onDestinationSelected,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              alignment: Alignment.topCenter,
              child: navigationShell,
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeDestination {
  const _HomeDestination({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  static List<_HomeDestination> values(AppLocalizations l10n) {
    return [
      _HomeDestination(
        icon: Icons.calendar_month,
        label: l10n.square,
      ),
      _HomeDestination(
        icon: Icons.edit,
        label: l10n.moodle,
      ),
      _HomeDestination(
        icon: Icons.book,
        label: l10n.library,
      ),
      _HomeDestination(
        icon: Icons.notifications_sharp,
        label: l10n.notifications,
      ),
      _HomeDestination(
        icon: Icons.person,
        label: l10n.account,
      ),
    ];
  }
}
