import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'tabs_navigation_screen.gr.dart';

@AutoRouterConfig(
  generateForDir: [
    'lib/exemples/day5/block5_navigation/tabs_navigation_screen',
  ],
)
class TabsNavigationScreen extends StatefulWidget {
  const TabsNavigationScreen({super.key});

  @override
  State<TabsNavigationScreen> createState() => _TabsNavigationScreenState();
}

class _TabsNavigationScreenState extends State<TabsNavigationScreen> {
  final TabsAppRouter _router = TabsAppRouter();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router.config());
  }
}

class TabsAppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: TabsRootRoute.page,
      initial: true,
      children: [
        AutoRoute(page: FeedTabRoute.page),
        AutoRoute(page: NotificationsTabRoute.page),
        AutoRoute(page: ProfileTabRoute.page),
      ],
    ),
  ];
}

@RoutePage()
class TabsRootScreen extends StatelessWidget {
  const TabsRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FeedTabRoute(),
        NotificationsTabRoute(),
        ProfileTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dynamic_feed_outlined),
              selectedIcon: Icon(Icons.dynamic_feed),
              label: 'Feed',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Avisos',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        );
      },
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: const Text('Tabs · AutoTabsScaffold'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Torna al menú del bloc',
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).maybePop(),
        ),
      ),
    );
  }
}

@RoutePage()
class FeedTabScreen extends StatefulWidget {
  const FeedTabScreen({super.key});

  @override
  State<FeedTabScreen> createState() => _FeedTabScreenState();
}

class _FeedTabScreenState extends State<FeedTabScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Comptador d\'aquesta tab: $_counter',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => setState(() => _counter++),
            icon: const Icon(Icons.add),
            label: const Text('+1'),
          ),
        ],
      ),
    );
  }
}

@RoutePage()
class NotificationsTabScreen extends StatelessWidget {
  const NotificationsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Avisos'));
  }
}

@RoutePage()
class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Perfil'));
  }
}
