import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/pages/home.dart';
import 'package:uaizu_app/ui/res/colors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Hikakin',
      debugShowCheckedModeBanner: false,
      theme: ref
          .watch(settingsProvider.select((settings) => settings.appTheme))
          .themeData,
      home: const HomePage(),
    );
  }
}

extension on AppTheme {
  ThemeData get themeData {
    switch (this) {
      case AppTheme.light:
        return AppThemeColor.light;
      case AppTheme.dark:
        return AppThemeColor.dark;
    }
  }
}
