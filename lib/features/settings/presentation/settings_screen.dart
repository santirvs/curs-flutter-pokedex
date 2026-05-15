import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_pokedex/i18n/strings.g.dart';

import 'settings_screen_controller.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mode = ref.watch(settingsScreenControllerProvider);
    final t = context.t;

    return Scaffold(
      appBar: AppBar(title: Text(t.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(t.appearance, style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment<ThemeMode>(
                value: ThemeMode.light,
                icon: const Icon(Icons.light_mode_outlined),
                label: Text(t.themeLight),
              ),
              ButtonSegment<ThemeMode>(
                value: ThemeMode.dark,
                icon: const Icon(Icons.dark_mode_outlined),
                label: Text(t.themeDark),
              ),
            ],
            selected: {mode},
            onSelectionChanged: (selection) {
              if (selection.isEmpty) return;
              ref
                  .read(settingsScreenControllerProvider.notifier)
                  .setThemeMode(selection.first);
            },
          ),
          const SizedBox(height: 24),
          Text(t.language, style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          SegmentedButton<AppLocale>(
            segments: [
              ButtonSegment<AppLocale>(
                value: AppLocale.ca,
                label: Text(t.languageCatalan),
              ),
              ButtonSegment<AppLocale>(
                value: AppLocale.es,
                label: Text(t.languageSpanish),
              ),
            ],
            selected: {LocaleSettings.currentLocale},
            onSelectionChanged: (selection) {
              if (selection.isEmpty) return;
              LocaleSettings.setLocale(selection.first);
            },
          ),
        ],
      ),
    );
  }
}
