import 'package:flutter/material.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final body = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TaggedWidget(
            tag: l10n.description,
            child: HorizontalExpandedContainer(
              child: Text(
                l10n.appDescription,
                style: Fonts.bodyS,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TaggedWidget(
            tag: l10n.version,
            child: const HorizontalExpandedContainer(
              child: Text(
                '1.0.0',
                style: Fonts.bodyS,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TaggedWidget(
            tag: l10n.sourceCode,
            child: InkWell(
              child: const HorizontalExpandedContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'https://github.com/brqnko/uaizu_app',
                      style: Fonts.bodyS,
                    ),
                    Icon(Icons.link),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),
          TaggedWidget(
            tag: l10n.license,
            child: InkWell(
              child: const HorizontalExpandedContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MIT License',
                      style: Fonts.bodyS,
                    ),
                    Icon(Icons.link),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 16),
          TaggedWidget(
            tag: l10n.privacyPolicy,
            child: InkWell(
              child: const HorizontalExpandedContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TPDO',
                      style: Fonts.bodyS,
                    ),
                    Icon(Icons.link),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: brandAppBar(context, title: l10n.about),
      backgroundColor: colorScheme.surface,
      body: body,
    );
  }
}
