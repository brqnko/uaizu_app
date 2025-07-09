import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/colors.dart';
import 'package:uaizu_app/ui/router/go_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final locale =
        ref.watch(settingsProvider.select((settings) => settings.appLocale));

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ref
          .watch(settingsProvider.select((settings) => settings.appTheme))
          .themeData,
      locale: Locale(locale.languageCode),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
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
