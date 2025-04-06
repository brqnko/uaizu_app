import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final settingWidgets = [
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
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
            ),
          ),
          title: Text(
            ref.watch(accountNameProvider),
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
          onTap: () {
            context.push('/account/appearance');
          },
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
          onTap: () {
            context.push('/account/about');
          },
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
      appBar: brandAppBar(
        context,
        title: 'Settings',
      ),
      body: body,
    );
  }
}
