import 'package:flutter/material.dart';

import 'l10n/bloc6_app_localizations.dart';

class FlutterBasicTranslationsScreen extends StatefulWidget {
  const FlutterBasicTranslationsScreen({super.key});

  @override
  State<FlutterBasicTranslationsScreen> createState() =>
      _FlutterBasicTranslationsScreenState();
}

class _FlutterBasicTranslationsScreenState
    extends State<FlutterBasicTranslationsScreen> {
  static const _locales = Bloc6AppLocalizations.supportedLocales;

  Locale _locale = _locales.first;

  void _setLocale(Locale next) => setState(() => _locale = next);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: Bloc6AppLocalizations.localizationsDelegates,
      supportedLocales: _locales,
      home: _TranslationsBody(locale: _locale, onLocaleChanged: _setLocale),
    );
  }
}

class _TranslationsBody extends StatelessWidget {
  const _TranslationsBody({
    required this.locale,
    required this.onLocaleChanged,
  });

  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = Bloc6AppLocalizations.of(context)!;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appBarTitle),
        leading: BackButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SegmentedButton<Locale>(
              segments: [
                for (final l in Bloc6AppLocalizations.supportedLocales)
                  ButtonSegment(
                    value: l,
                    label: Text(l.languageCode.toUpperCase()),
                  ),
              ],
              selected: {locale},
              onSelectionChanged: (set) => onLocaleChanged(set.first),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.greeting('Arnau'), style: titleStyle),
                    const SizedBox(height: 8),
                    Text(l10n.welcome),
                    const SizedBox(height: 8),
                    Text(l10n.itemsCount(3)),
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
