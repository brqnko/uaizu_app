import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/state/home_index.dart';
import 'package:uaizu_app/ui/pages/library/library.dart';
import 'package:uaizu_app/ui/pages/lms/lms.dart';
import 'package:uaizu_app/ui/pages/notification/notification.dart';

import 'campus_square/campus_square.dart';
import 'settings/settings.dart';

const _pages = [
  CampusSquarePage(),
  LMSPage(),
  LibraryPage(),
  NotificationPage(),
  AccountPage(),
];

const _items = [
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
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeIndexProvider);

    final colorScheme = Theme.of(context).colorScheme;

    final bar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _items,
      backgroundColor: colorScheme.primary,
      selectedItemColor: colorScheme.onPrimaryFixed,
      unselectedItemColor: colorScheme.onPrimary,
      currentIndex: index,
      onTap: (newIndex) {
        ref.read(homeIndexProvider.notifier).state = newIndex;
      },
    );

    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: SizedBox(
        height: 75,
        child: bar,
      ),
    );
  }
}
