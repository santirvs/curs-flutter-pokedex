import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_service.g.dart';

@riverpod
class ThemeModePreference extends _$ThemeModePreference {
  @override
  ThemeMode build() => ThemeMode.light;

  void setLight() => state = ThemeMode.light;

  void setDark() => state = ThemeMode.dark;
}
