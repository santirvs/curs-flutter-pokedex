import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/theme_mode_service.dart';

part 'my_settings_screen_controller.g.dart';

@riverpod
class MySettingsScreenController extends _$MySettingsScreenController {
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
