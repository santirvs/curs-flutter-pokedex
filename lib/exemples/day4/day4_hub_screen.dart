import 'package:flutter/material.dart';

import 'block1_responsive_platform/b1_hub_screen.dart';
import 'block2_system_preferences/shared_preferences_demo_screen.dart';
import 'widgets/root_hub.dart';

class Day4HubScreen extends StatelessWidget {
  const Day4HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day4RootHub(
      title: 'Dia 4 · Exemples',
      sections: [
        Day4HubSection(
          badge: '1',
          title: 'Bloc 1 · Web, escriptori i responsive',
          subtitle:
              'LayoutBuilder, MediaQuery, shells adaptatius, menús, punter i scroll',
          screen: Day4B1HubScreen(),
        ),
        Day4HubSection(
          badge: '2',
          title: 'Bloc 2 · SharedPreferences',
          subtitle:
              'getInstance, get/set, claus i persistència entre sessions.',
          screen: SharedPreferencesDemoScreen(),
        ),
      ],
    );
  }
}
