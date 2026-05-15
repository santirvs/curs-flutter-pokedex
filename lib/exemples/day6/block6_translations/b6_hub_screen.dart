import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'flutter_basic_translations_screen.dart';
import 'slang_translations_screen.dart';

class Day6B6HubScreen extends StatelessWidget {
  const Day6B6HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Traduccions',
      items: [
        Day3DemoItem(
          title: 'Flutter · gen-l10n + ARB',
          subtitle:
              'Arxius .arb i `Bloc6AppLocalizations`; canvi d\'idioma local.',
          screen: FlutterBasicTranslationsScreen(),
        ),
        Day3DemoItem(
          title: 'Slang · JSON tipats + codegen',
          subtitle:
              'Cadenes generades, plurals i `t.foo.bar` amb autocomplete.',
          screen: SlangTranslationsScreen(),
        ),
      ],
    );
  }
}
