import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class CampusSquarePage extends ConsumerWidget {
  const CampusSquarePage(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      iconTheme: IconThemeData(color: colorScheme.onPrimaryFixed),
      title: Center(
        child: Text(
          'Campus Square',
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
      ),
    );

    final drawer = Drawer(
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
          ListTile(
            title: Text(
              'スケジュール',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              navigationShell.goBranch(
                0,
                initialLocation: 0 == navigationShell.currentIndex,
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              '履修',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              navigationShell.goBranch(
                1,
                initialLocation: 1 == navigationShell.currentIndex,
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              '成績',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              navigationShell.goBranch(
                2,
                initialLocation: 2 == navigationShell.currentIndex,
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'シラバス',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              navigationShell.goBranch(
                3,
                initialLocation: 3 == navigationShell.currentIndex,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: navigationShell,
    );
  }
}
