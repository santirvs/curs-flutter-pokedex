import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'basic_navigation_screen.gr.dart';

@AutoRouterConfig(
  generateForDir: [
    'lib/exemples/day5/block5_navigation/basic_navigation_screen',
  ],
)
class BasicNavigationScreen extends StatefulWidget {
  const BasicNavigationScreen({super.key});

  @override
  State<BasicNavigationScreen> createState() => _BasicNavigationScreenState();
}

class _BasicNavigationScreenState extends State<BasicNavigationScreen> {
  final BasicAppRouter _router = BasicAppRouter();

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

class BasicAppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: BasicHomeRoute.page, initial: true),
    AutoRoute(page: BasicDetailRoute.page),
  ];
}

@RoutePage()
class BasicHomeScreen extends StatelessWidget {
  const BasicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bàsic · Home'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Torna al menú del bloc',
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).maybePop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              onPressed: () =>
                  context.router.push(BasicDetailRoute(itemId: 42)),
              icon: const Icon(Icons.description_outlined),
              label: const Text('push · obre detall #42 (arg tipat)'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () =>
                  context.router.replace(BasicDetailRoute(itemId: 100)),
              icon: const Icon(Icons.swap_horiz),
              label: const Text('replace · canvia per detall #100'),
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class BasicDetailScreen extends StatelessWidget {
  const BasicDetailScreen({super.key, required this.itemId});

  final int itemId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detall #$itemId')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hem rebut itemId = $itemId',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () =>
                  context.router.push(BasicDetailRoute(itemId: itemId + 1)),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('push · següent ítem'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => context.router.popUntilRoot(),
              icon: const Icon(Icons.home_outlined),
              label: const Text('popUntilRoot · tornar a Home'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => context.router.maybePop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('maybePop · tornar enrere'),
            ),
          ],
        ),
      ),
    );
  }
}
