import 'package:flutter/material.dart';

import 'package:my_pokedex/exemples/day3/widgets/block_hub.dart';
import 'adaptive_menus_screen.dart';
import 'adaptive_navigation_shell_screen.dart';
import 'media_query_inspector_screen.dart';
import 'platform_pointer_scroll_screen.dart';
import 'responsive_breakpoints_screen.dart';

class Day4B1HubScreen extends StatelessWidget {
  const Day4B1HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Web, escriptori i responsive',
      items: [
        Day3DemoItem(
          title: 'Breakpoints i LayoutBuilder',
          subtitle:
              'Amplada màxima, classes compact/medium/expanded i grid adaptatiu.',
          screen: ResponsiveBreakpointsScreen(),
        ),
        Day3DemoItem(
          title: 'MediaQuery en viu',
          subtitle:
              'sizeOf, paddingOf, viewInsetsOf, orientation, textScaler, teclat.',
          screen: MediaQueryInspectorScreen(),
        ),
        Day3DemoItem(
          title: 'Navegació rail vs barra inferior',
          subtitle:
              'NavigationRail + extended si hi ha espai; NavigationBar al mòbil.',
          screen: AdaptiveNavigationShellScreen(),
        ),
        Day3DemoItem(
          title: 'Menús segons amplada',
          subtitle:
              'MenuBar i SubmenuButton (ample) vs PopupMenuButton (estret).',
          screen: AdaptiveMenusScreen(),
        ),
        Day3DemoItem(
          title: 'Plataforma, punter i scroll',
          subtitle:
              'kIsWeb, TargetPlatform, Switch.adaptive, MouseRegion, ScrollConfiguration.',
          screen: PlatformPointerScrollScreen(),
        ),
      ],
    );
  }
}
