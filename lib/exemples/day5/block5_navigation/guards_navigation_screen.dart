import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'guards_navigation_screen.gr.dart';

@AutoRouterConfig(
  generateForDir: [
    'lib/exemples/day5/block5_navigation/guards_navigation_screen',
  ],
)
class GuardsNavigationScreen extends StatefulWidget {
  const GuardsNavigationScreen({super.key});

  @override
  State<GuardsNavigationScreen> createState() => _GuardsNavigationScreenState();
}

class _GuardsNavigationScreenState extends State<GuardsNavigationScreen> {
  final GuardsAppRouter _router = GuardsAppRouter();

  @override
  void initState() {
    super.initState();
    AuthGuard.isAuthenticated = false;
  }

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

class GuardsAppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GuardsHomeRoute.page, initial: true),
    AutoRoute(page: GuardsLoginRoute.page),
    AutoRoute(page: GuardsProfileRoute.page, guards: [AuthGuard()]),
  ];
}

class AuthGuard extends AutoRouteGuard {
  static bool isAuthenticated = false;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (isAuthenticated) return resolver.next();
    final didLogin = await router.push(const GuardsLoginRoute());
    resolver.next(didLogin == true);
  }
}

@RoutePage()
class GuardsHomeScreen extends StatelessWidget {
  const GuardsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guards · Home'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Torna al menú del bloc',
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Tanca sessió',
            onPressed: () {
              AuthGuard.isAuthenticated = false;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Sessió tancada')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              onPressed: () => context.router.push(const GuardsProfileRoute()),
              icon: const Icon(Icons.lock_outline),
              label: const Text('Obre el perfil (protegit)'),
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class GuardsLoginScreen extends StatefulWidget {
  const GuardsLoginScreen({super.key});

  @override
  State<GuardsLoginScreen> createState() => _GuardsLoginScreenState();
}

class _GuardsLoginScreenState extends State<GuardsLoginScreen> {
  bool _loading = false;

  Future<void> _doLogin() async {
    setState(() => _loading = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    AuthGuard.isAuthenticated = true;
    if (!mounted) return;
    context.router.maybePop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicia sessió')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              onPressed: _loading ? null : _doLogin,
              icon: _loading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.login),
              label: const Text('Iniciar sessió (simulat)'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => context.router.maybePop(false),
              icon: const Icon(Icons.close),
              label: const Text('Cancel·lar'),
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class GuardsProfileScreen extends StatelessWidget {
  const GuardsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil (protegit)')),
      body: const Center(child: SizedBox.shrink()),
    );
  }
}
