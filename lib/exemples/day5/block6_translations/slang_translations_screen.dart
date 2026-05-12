import 'package:flutter/material.dart';

import 'i18n/strings.g.dart';

class SlangTranslationsScreen extends StatefulWidget {
  const SlangTranslationsScreen({super.key});

  @override
  State<SlangTranslationsScreen> createState() =>
      _SlangTranslationsScreenState();
}

class _SlangTranslationsScreenState extends State<SlangTranslationsScreen> {
  @override
  void initState() {
    super.initState();
    LocaleSettings.setLocaleSync(AppLocale.ca);
  }

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(child: const _TranslationsBody());
  }
}

class _TranslationsBody extends StatelessWidget {
  const _TranslationsBody();

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(title: Text(t.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SegmentedButton<AppLocale>(
              segments: [
                for (final l in AppLocale.values)
                  ButtonSegment(
                    value: l,
                    label: Text(l.languageCode.toUpperCase()),
                  ),
              ],
              selected: {LocaleSettings.currentLocale},
              onSelectionChanged: (set) => LocaleSettings.setLocale(set.first),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.greeting(name: 'Arnau'), style: titleStyle),
                    const SizedBox(height: 8),
                    Text(t.welcome),
                    const SizedBox(height: 8),
                    Text(t.itemsCount(n: 3)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
