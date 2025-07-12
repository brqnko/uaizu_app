import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class CampusSquareDrawer extends ConsumerWidget {
  const CampusSquareDrawer({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: colorScheme.primary,
      child: ListView(
        children: [
          SizedBox(
            height: 70,
            child: DrawerHeader(
              child: TextButton(
                onPressed: () {
                  context.push('/account/account');
                },
                child: Text(
                  ref.watch(accountNameProvider),
                  style:
                      Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
                ),
              ),
            ),
          ),
          _DrawerNavItem(
            title: l10n.schedule,
            onTap: () => _navigateToIndex(context, 0),
          ),
          _DrawerNavItem(
            title: l10n.registration,
            onTap: () => _navigateToIndex(context, 1),
          ),
          _DrawerNavItem(
            title: l10n.gradeAndExam,
            onTap: () => _navigateToIndex(context, 2),
          ),
          _DrawerNavItem(
            title: l10n.syllabus,
            onTap: () => _navigateToIndex(context, 3),
          ),
        ],
      ),
    );
  }

  void _navigateToIndex(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    Navigator.pop(context);
  }
}

class _DrawerNavItem extends StatelessWidget {
  const _DrawerNavItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(
        title,
        style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
      ),
      onTap: onTap,
    );
  }
}
