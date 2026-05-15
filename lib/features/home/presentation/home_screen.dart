import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex/core/router/app_router.dart';
import 'package:my_pokedex/i18n/strings.g.dart';

import '../../admin/presentation/admin_screen.dart';
import '../../map/presentation/map_screen.dart';
import '../../ranking/presentation/ranking_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  static const List<Widget> _destinations = [
    MapScreen(),
    RankingScreen(),
    AdminScreen(),
  ];

  int _currentIndex = 0;
  bool _wasInBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _wasInBackground = true;
    } else if (state == AppLifecycleState.resumed && _wasInBackground) {
      _wasInBackground = false;
      _showWelcomeBackDialog();
    }
  }

  void _showWelcomeBackDialog() {
    if (!mounted) return;
    final t = context.t;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.welcomeBackTitle),
        content: Text(t.welcomeBackBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(t.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final titles = [t.homeMap, t.homeRanking, t.homeAdmin];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: t.settingsTooltip,
            onPressed: () => context.router.push(const SettingsRoute()),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _destinations),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.map_outlined),
            selectedIcon: const Icon(Icons.map),
            label: t.homeMap,
          ),
          NavigationDestination(
            icon: const Icon(Icons.leaderboard_outlined),
            selectedIcon: const Icon(Icons.leaderboard),
            label: t.homeRanking,
          ),
          NavigationDestination(
            icon: const Icon(Icons.admin_panel_settings_outlined),
            selectedIcon: const Icon(Icons.admin_panel_settings),
            label: t.homeAdmin,
          ),
        ],
      ),
    );
  }
}
