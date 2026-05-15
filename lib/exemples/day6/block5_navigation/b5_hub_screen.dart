import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'basic_navigation_screen.dart';
import 'guards_navigation_screen.dart';
import 'tabs_navigation_screen.dart';

class Day6B5HubScreen extends StatelessWidget {
  const Day6B5HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Navegació · auto_route',
      items: [
        Day3DemoItem(
          title: 'Bàsic · push / pop / replace',
          subtitle: 'Mini-app amb Home → Detall → Settings i arguments tipats.',
          screen: BasicNavigationScreen(),
        ),
        Day3DemoItem(
          title: 'Tabs · AutoTabsScaffold',
          subtitle:
              'Bottom navigation amb children, NavigationBar i estat per tab.',
          screen: TabsNavigationScreen(),
        ),
        Day3DemoItem(
          title: 'Guards · auth + redirect',
          subtitle:
              'AutoRouteGuard que protegeix una ruta i redirigeix a login.',
          screen: GuardsNavigationScreen(),
        ),
      ],
    );
  }
}
