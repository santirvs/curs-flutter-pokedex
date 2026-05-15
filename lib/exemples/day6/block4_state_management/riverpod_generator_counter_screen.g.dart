// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_generator_counter_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GeneratedCounter)
final generatedCounterProvider = GeneratedCounterProvider._();

final class GeneratedCounterProvider
    extends $NotifierProvider<GeneratedCounter, int> {
  GeneratedCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generatedCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generatedCounterHash();

  @$internal
  @override
  GeneratedCounter create() => GeneratedCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$generatedCounterHash() => r'6aa0c85b3fa88f65067d39bb3e302e21f15757dd';

abstract class _$GeneratedCounter extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
