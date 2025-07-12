import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/navigation/campus_square_drawer.dart';

class CampusSquarePage extends ConsumerWidget {
  const CampusSquarePage(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    final appBar = brandAppBar(context, title: l10n.campusSquare);
    final drawer = CampusSquareDrawer(navigationShell: navigationShell);

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: navigationShell,
    );
  }
}
