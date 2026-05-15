// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeModePreference)
final themeModePreferenceProvider = ThemeModePreferenceProvider._();

final class ThemeModePreferenceProvider
    extends $NotifierProvider<ThemeModePreference, ThemeMode> {
  ThemeModePreferenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModePreferenceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModePreferenceHash();

  @$internal
  @override
  ThemeModePreference create() => ThemeModePreference();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModePreferenceHash() =>
    r'd3447e7ab246415845c39bc8b27afdfc23ed4155';

abstract class _$ThemeModePreference extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
