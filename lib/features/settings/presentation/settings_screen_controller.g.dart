// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingsScreenController)
final settingsScreenControllerProvider = SettingsScreenControllerProvider._();

final class SettingsScreenControllerProvider
    extends $NotifierProvider<SettingsScreenController, ThemeMode> {
  SettingsScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsScreenControllerHash();

  @$internal
  @override
  SettingsScreenController create() => SettingsScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$settingsScreenControllerHash() =>
    r'5848110b2f35bf45bbf120596fa0fa491787e588';

abstract class _$SettingsScreenController extends $Notifier<ThemeMode> {
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
