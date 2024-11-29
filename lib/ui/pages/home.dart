import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      backgroundColor: colorScheme.primary,
      selectedItemColor: colorScheme.onPrimaryFixed,
      unselectedItemColor: colorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Square',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Moodle',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: '図書館',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_sharp),
          label: '通知',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'アカウント',
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
        height: 75,
        child: bottomNavigationBar,
      ),
    );
  }
}
