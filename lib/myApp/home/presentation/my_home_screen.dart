import 'package:flutter/material.dart';
import 'package:pokedex/myApp/widgets/utils/utils.dart';

import '../../admin/presentation/my_admin_screen.dart';
import '../../map/presentation/my_map_screen.dart';
import '../../ranking/presentation/my_ranking_screen.dart';
import '../../list/presentation/my_list.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> with WidgetsBindingObserver {
  static const List<Widget> _destinations = [
    MyListScreen(),
    MyMapScreen(),
    MyRankingScreen(),
    MyAdminScreen(),
  ];

  // Establir el current index a la pantalla que volem inicialment (0..3)
  int _currentIndex = 3;
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

  // Alerta que ens agraeix que tornem a l'aplicació
  void _showWelcomeBackDialog() {
    if (!mounted) return;
    showCustomDialog(context, 'Benvingut de nou', 'Ens alegra tornar-te a veure.');
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _destinations),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(Icons.list),
            label: 'Llista',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined),
            selectedIcon: Icon(Icons.leaderboard),
            label: 'Ranking',
          ),
          NavigationDestination(
            icon: Icon(Icons.admin_panel_settings_outlined),
            selectedIcon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
        ],
      ),
    );
  }
}
