import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      title: Center(
        child: Text(
          'Account',
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
      ),
    );

    final body = Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        runSpacing: 20,
        children: [
          const SizedBox(height: 20),
          Text(
            'Campus Square Account',
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          TextFormField(
            initialValue: ref.watch(settingsProvider).accountInfo.studentId,
            obscureText: ref.watch(settingsProvider).hideStudentId,
            decoration: const InputDecoration(
              labelText: 'Student ID',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(settingsProvider.notifier).update(studentId: value);
            },
          ),
          TextFormField(
            obscureText: true,
            initialValue: ref.watch(settingsProvider).accountInfo.password,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(settingsProvider.notifier).update(password: value);
            },
          ),
          Text(
            'Appearance',
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          ListTile(
            title: Text(
              'Language',
              style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            trailing: DropdownButton(
              value: ref.watch(settingsProvider).appLocale.languageCode,
              onChanged: (String? value) {
                if (value == null) {
                  return;
                }

                ref.read(settingsProvider.notifier).update(
                      appLocale: AppLocale.values
                          .firstWhere((locale) => locale.languageCode == value),
                    );
              },
              items: AppLocale.values
                  .map(
                    (locale) => DropdownMenuItem(
                      value: locale.languageCode,
                      child: Text(
                        locale.title,
                        style: Fonts.bodyM
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          ListTile(
            title: Text(
              'Theme',
              style: Fonts.titleM.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            trailing: DropdownButton(
              value: ref.watch(settingsProvider).appTheme.name,
              onChanged: (String? value) {
                if (value == null) {
                  return;
                }

                ref.read(settingsProvider.notifier).update(
                      appTheme: AppTheme.values
                          .firstWhere((locale) => locale.name == value),
                    );
              },
              items: AppTheme.values
                  .map(
                    (locale) => DropdownMenuItem(
                      value: locale.name,
                      child: Text(
                        locale.name,
                        style: Fonts.bodyM
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          ListTile(
            title: Text(
              'Hide Student ID',
              style: Fonts.titleM.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            trailing: Switch(
              value: ref.watch(settingsProvider
                  .select((settings) => settings.hideStudentId)),
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .update(hideStudentId: value);
              },
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: body,
    );
  }
}
