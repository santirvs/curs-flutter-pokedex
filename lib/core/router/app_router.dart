import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:my_pokedex/features/admin/presentation/admin_screen.dart';
import 'package:my_pokedex/features/authentication/presentation/loading_screen.dart';
import 'package:my_pokedex/features/home/presentation/home_screen.dart';
import 'package:my_pokedex/features/settings/presentation/settings_screen.dart';

//Afegeixo les meves pantalles
import 'package:my_pokedex/myApp/home/presentation/my_home_screen.dart';
import 'package:my_pokedex/myApp/authentication/presentation/my_loading_screen.dart';
import 'package:my_pokedex/myApp/settings/presentation/my_settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  generateForDir: [
    'lib/features/admin/presentation',
    'lib/features/authentication/presentation',
    'lib/features/home/presentation',
    'lib/features/settings/presentation',
    'lib/myApp/home/presentation',
    'lib/myApp/authentication/presentation',
    'lib/myApp/settings/presentation'
  ],
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    //AutoRoute(page: LoadingRoute.page, initial: true),
    //AutoRoute(page: HomeRoute.page),
    //AutoRoute(page: SettingsRoute.page),
    //AutoRoute(page: AdminRoute.page),
    AutoRoute(page: MyHomeRoute.page),
    AutoRoute(page: MyLoadingRoute.page, initial: true),
    AutoRoute(page: SettingsRoute.page),
    //AutoRoute(page: MyAdminRoute.page),
  ];
}
