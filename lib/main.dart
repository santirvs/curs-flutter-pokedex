import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_pokedex/core/router/app_router.dart';
import 'package:my_pokedex/core/theme/app_theme.dart';
import 'package:my_pokedex/features/settings/application/theme_mode_service.dart';
import 'package:my_pokedex/i18n/strings.g.dart';

final appRouter = AppRouter();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.setLocaleSync(AppLocale.ca);
  runApp(ProviderScope(child: TranslationProvider(child: const PokedexApp())));
}

class PokedexApp extends ConsumerWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModePreferenceProvider);
    final locale = TranslationProvider.of(context).flutterLocale;

    return MaterialApp.router(
      // Usamos .copyWith para mantener lo que ya tenía AppTheme pero cambiando la fuente
      theme: AppTheme.light.copyWith(
        textTheme: AppTheme.light.textTheme.apply(fontFamily: 'CoC'),
        primaryTextTheme: AppTheme.light.primaryTextTheme.apply(
          fontFamily: 'CoC',
        ),
      ),
      darkTheme: AppTheme.dark.copyWith(
        textTheme: AppTheme.dark.textTheme.apply(fontFamily: 'CoC'),
        primaryTextTheme: AppTheme.dark.primaryTextTheme.apply(
          fontFamily: 'CoC',
        ),
      ),
      themeMode: themeMode,
      locale: locale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: appRouter.config(),
    );
  }
}


/*  Abans del dia 6... 
class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Theme per CoC
      theme: ThemeData(
          fontFamily: 'CoC', // Configuración de la fuente global
          useMaterial3: true,
        ),

      //home: const Day6HubScreen(),
       home: const LoadingScreen(),
      //home: const MyLoadingScreen(),
    );
  }
}
*/