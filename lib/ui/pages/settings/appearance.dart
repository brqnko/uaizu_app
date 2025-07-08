import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';

class AppearancePage extends ConsumerWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final settingsWidgets = [
      // language
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: ListTile(
          title: Text(l10n.language),
          subtitle: Text(
            ref.watch(settingsProvider.select((s) => s.appLocale)).title,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return HorizontalExpandedContainer(
                  child: Column(
                    children: AppLocale.values
                        .map(
                          (locale) => ListTile(
                            title: Text(locale.title),
                            onTap: () {
                              ref.read(settingsProvider.notifier).update(
                                    appLocale: locale,
                                  );
                              Navigator.pop(context);
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
      // theme
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: ListTile(
          title: Text(l10n.theme),
          subtitle: Text(
            _getThemeDisplayName(
                ref.watch(settingsProvider.select((s) => s.appTheme)), l10n),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return HorizontalExpandedContainer(
                  child: Column(
                    children: AppTheme.values
                        .map(
                          (theme) => ListTile(
                            title: Text(_getThemeDisplayName(theme, l10n)),
                            onTap: () {
                              ref.read(settingsProvider.notifier).update(
                                    appTheme: theme,
                                  );
                              Navigator.pop(context);
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
      // hide student id
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: ListTile(
          title: Text(l10n.hideStudentId),
          subtitle: Text(
            ref.watch(settingsProvider.select((s) => s.hideStudentId))
                ? l10n.enabled
                : l10n.disabled,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            ref.read(settingsProvider.notifier).update(
                  hideStudentId: !ref.watch(settingsProvider).hideStudentId,
                );
          },
        ),
      ),
    ];

    final body = Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (context, index) => settingsWidgets[index],
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: settingsWidgets.length,
      ),
    );

    return Scaffold(
      appBar: brandAppBar(context, title: l10n.appearance),
      backgroundColor: colorScheme.surface,
      body: body,
    );
  }

  String _getThemeDisplayName(AppTheme theme, AppLocalizations l10n) {
    switch (theme) {
      case AppTheme.light:
        return l10n.light;
      case AppTheme.dark:
        return l10n.dark;
    }
  }
}
