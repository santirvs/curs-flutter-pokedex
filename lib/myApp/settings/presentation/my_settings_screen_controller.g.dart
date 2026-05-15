// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_settings_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MySettingsScreenController)
final mySettingsScreenControllerProvider =
    MySettingsScreenControllerProvider._();

final class MySettingsScreenControllerProvider
    extends $NotifierProvider<MySettingsScreenController, ThemeMode> {
  MySettingsScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mySettingsScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mySettingsScreenControllerHash();

  @$internal
  @override
  MySettingsScreenController create() => MySettingsScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$mySettingsScreenControllerHash() =>
    r'59f6c8bdbd84c4b445eca6d864049c993153b0de';

abstract class _$MySettingsScreenController extends $Notifier<ThemeMode> {
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
