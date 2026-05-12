// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_dio_post_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RandomPostController)
final randomPostControllerProvider = RandomPostControllerProvider._();

final class RandomPostControllerProvider
    extends $AsyncNotifierProvider<RandomPostController, Post> {
  RandomPostControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomPostControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomPostControllerHash();

  @$internal
  @override
  RandomPostController create() => RandomPostController();
}

String _$randomPostControllerHash() =>
    r'8ca58c5ae54b1e33d5b3ea0c1df4f17fc53649b4';

abstract class _$RandomPostController extends $AsyncNotifier<Post> {
  FutureOr<Post> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Post>, Post>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Post>, Post>,
              AsyncValue<Post>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
