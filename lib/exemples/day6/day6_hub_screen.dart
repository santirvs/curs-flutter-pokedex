import 'package:flutter/material.dart';

import 'block4_state_management/b4_hub_screen.dart';
import 'block5_navigation/b5_hub_screen.dart';
import 'block6_translations/b6_hub_screen.dart';
import 'widgets/root_hub.dart';

class Day6HubScreen extends StatelessWidget {
  const Day6HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day6RootHub(
      title: 'Dia 6 · Exemples',
      sections: [
        Day6HubSection(
          badge: '4',
          title: 'Bloc 4 · State management',
          subtitle: 'Comptador amb provider i amb flutter_riverpod.',
          screen: Day6B4HubScreen(),
        ),
        Day6HubSection(
          badge: '5',
          title: 'Bloc 5 · Navegació',
          subtitle:
              'Mini-app amb auto_route, rutes generades i arguments tipats.',
          screen: Day6B5HubScreen(),
        ),
        Day6HubSection(
          badge: '6',
          title: 'Bloc 6 · Traduccions',
          subtitle:
              'Comparativa Flutter natiu (intl + Localizations) vs slang.',
          screen: Day6B6HubScreen(),
        ),
      ],
    );
  }
}
