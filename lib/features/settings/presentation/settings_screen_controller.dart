import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/theme_mode_service.dart';

part 'settings_screen_controller.g.dart';

@riverpod
class SettingsScreenController extends _$SettingsScreenController {
  @override
  ThemeMode build() => ref.watch(themeModePreferenceProvider);

  void setThemeMode(ThemeMode mode) {
    final notifier = ref.read(themeModePreferenceProvider.notifier);
    if (mode == ThemeMode.dark) {
      notifier.setDark();
    } else {
      notifier.setLight();
    }
  }
}
