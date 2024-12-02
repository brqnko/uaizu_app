import 'package:flutter/material.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final body = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TaggedWidget(
            tag: 'Description',
            child: HorizontalExpandedContainer(
              child: Text(
                'uaizu_app allows you to access Campus Square, Moodle and Library without browser.',
                style: Fonts.bodyS,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const TaggedWidget(
            tag: 'Version',
            child: HorizontalExpandedContainer(
              child: Text(
                '1.0.0',
                style: Fonts.bodyS,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TaggedWidget(
            tag: 'Source Code',
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
            tag: 'License',
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
            tag: 'Privacy Policy',
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
      appBar: brandAppBar(context, title: 'About'),
      backgroundColor: colorScheme.surface,
      body: body,
    );
  }
}
