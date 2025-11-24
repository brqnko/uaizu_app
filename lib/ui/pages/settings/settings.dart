import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isApiKeyObscured = useState(true);

    final currentApiKey = ref.watch(
      settingsProvider.select((s) => s.geminiApiKey ?? ''),
    );

    final apiKeyController = useTextEditingController(text: currentApiKey);

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
              hintText: l10n.search,
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
            l10n.accountTitle,
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
            l10n.appearance,
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          subtitle: Text(
            l10n.languageThemeStudentId,
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
            l10n.about,
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          subtitle: Text(
            l10n.versionLicensePrivacy,
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurface),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurface,
          ),
        ),
      ),
      // Gemini API Key input
      Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.key,
                    color: colorScheme.onSurface,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Gemini API Key',
                    style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: apiKeyController,
                obscureText: isApiKeyObscured.value,
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).update(
                    geminiApiKey: value,
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Gemini API Key',
                  hintStyle: Fonts.bodyM.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isApiKeyObscured.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: colorScheme.onSurface,
                    ),
                    onPressed: () {
                      isApiKeyObscured.value = !isApiKeyObscured.value;
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: colorScheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: Fonts.bodyM.copyWith(color: colorScheme.onSurface),
              ),
            ],
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
        title: l10n.settings,
      ),
      body: body,
    );
  }
}
