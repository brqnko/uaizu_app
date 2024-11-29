import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

import '../../../state/settings.dart';
import '../../widgets/app_bar.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    // final body = Padding(
    //   padding: const EdgeInsets.all(12),
    //   child: Wrap(
    //     runSpacing: 20,
    //     children: [
    //       ListTile(
    //         title: Text(
    //           'Language',
    //           style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
    //         ),
    //         trailing: DropdownButton(
    //           value: ref.watch(settingsProvider).appLocale.languageCode,
    //           onChanged: (String? value) {
    //             if (value == null) {
    //               return;
    //             }
    //
    //             ref.read(settingsProvider.notifier).update(
    //                   appLocale: AppLocale.values
    //                       .firstWhere((locale) => locale.languageCode == value),
    //                 );
    //           },
    //           items: AppLocale.values
    //               .map(
    //                 (locale) => DropdownMenuItem(
    //                   value: locale.languageCode,
    //                   child: Text(
    //                     locale.title,
    //                     style: Fonts.bodyM
    //                         .copyWith(color: colorScheme.onSurfaceVariant),
    //                   ),
    //                 ),
    //               )
    //               .toList(),
    //         ),
    //       ),
    //       ListTile(
    //         title: Text(
    //           'Theme',
    //           style: Fonts.titleM.copyWith(color: colorScheme.onSurfaceVariant),
    //         ),
    //         trailing: DropdownButton(
    //           value: ref.watch(settingsProvider).appTheme.name,
    //           onChanged: (String? value) {
    //             if (value == null) {
    //               return;
    //             }
    //
    //             ref.read(settingsProvider.notifier).update(
    //                   appTheme: AppTheme.values
    //                       .firstWhere((locale) => locale.name == value),
    //                 );
    //           },
    //           items: AppTheme.values
    //               .map(
    //                 (locale) => DropdownMenuItem(
    //                   value: locale.name,
    //                   child: Text(
    //                     locale.name,
    //                     style: Fonts.bodyM
    //                         .copyWith(color: colorScheme.onSurfaceVariant),
    //                   ),
    //                 ),
    //               )
    //               .toList(),
    //         ),
    //       ),
    //       ListTile(
    //         title: Text(
    //           'Hide Student ID',
    //           style: Fonts.titleM.copyWith(color: colorScheme.onSurfaceVariant),
    //         ),
    //         trailing: Switch(
    //           value: ref.watch(settingsProvider
    //               .select((settings) => settings.hideStudentId)),
    //           onChanged: (value) {
    //             ref
    //                 .read(settingsProvider.notifier)
    //                 .update(hideStudentId: value);
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    final settingWidgets = [
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        // search field
        child: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
              prefixIcon: Icon(
                Icons.search,
                color: colorScheme.onSurface,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: colorScheme.secondary,
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: ListTile(
          onTap: () {
            context.push('/account/account');
          },
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: colorScheme.onSurface,
            child: const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
          title: Text(
            ref.watch(settingsProvider.select((s) => s.accountInfo.studentId)),
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          subtitle: Text(
            'Campus Square and Moodle Account',
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurface),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // simple button >
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurface,
          ),
        ),
      ),
      // appearance
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: ListTile(
          onTap: () {},
          title: Text(
            'Appearance',
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          subtitle: Text(
            'Language, Theme, Hide Student ID',
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurface),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurface,
          ),
        ),
      ),
      // about
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: ListTile(
          onTap: () {},
          title: Text(
            'About',
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          subtitle: Text(
            'Version, License, Privacy Policy',
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurface),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    ];

    final body = Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: settingWidgets.length,
        itemBuilder: (context, index) {
          return settingWidgets[index];
        },
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar(
        context,
        'Settings',
      ),
      body: body,
    );
  }
}
