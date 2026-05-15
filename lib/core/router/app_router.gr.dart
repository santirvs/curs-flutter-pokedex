// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AdminScreen]
class AdminRoute extends PageRouteInfo<void> {
  const AdminRoute({List<PageRouteInfo>? children})
    : super(AdminRoute.name, initialChildren: children);

  static const String name = 'AdminRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<LoadingRouteArgs> {
  LoadingRoute({
    Key? key,
    Duration minimumDisplayDuration = Duration.zero,
    Future<void>? readiness,
    List<PageRouteInfo>? children,
  }) : super(
         LoadingRoute.name,
         args: LoadingRouteArgs(
           key: key,
           minimumDisplayDuration: minimumDisplayDuration,
           readiness: readiness,
         ),
         initialChildren: children,
       );

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoadingRouteArgs>(
        orElse: () => const LoadingRouteArgs(),
      );
      return LoadingScreen(
        key: args.key,
        minimumDisplayDuration: args.minimumDisplayDuration,
        readiness: args.readiness,
      );
    },
  );
}

class LoadingRouteArgs {
  const LoadingRouteArgs({
    this.key,
    this.minimumDisplayDuration = Duration.zero,
    this.readiness,
  });

  final Key? key;

  final Duration minimumDisplayDuration;

  final Future<void>? readiness;

  @override
  String toString() {
    return 'LoadingRouteArgs{key: $key, minimumDisplayDuration: $minimumDisplayDuration, readiness: $readiness}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoadingRouteArgs) return false;
    return key == other.key &&
        minimumDisplayDuration == other.minimumDisplayDuration &&
        readiness == other.readiness;
  }

  @override
  int get hashCode =>
      key.hashCode ^ minimumDisplayDuration.hashCode ^ readiness.hashCode;
}

/// generated route for
/// [MyHomeScreen]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyHomeScreen();
    },
  );
}

/// generated route for
/// [MyLoadingScreen]
class MyLoadingRoute extends PageRouteInfo<MyLoadingRouteArgs> {
  MyLoadingRoute({
    Key? key,
    Duration minimumDisplayDuration = const Duration(milliseconds: 3000),
    Future<void>? readiness,
    WidgetBuilder nextScreenBuilder = defaultNextScreen,
    List<PageRouteInfo>? children,
  }) : super(
         MyLoadingRoute.name,
         args: MyLoadingRouteArgs(
           key: key,
           minimumDisplayDuration: minimumDisplayDuration,
           readiness: readiness,
           nextScreenBuilder: nextScreenBuilder,
         ),
         initialChildren: children,
       );

  static const String name = 'MyLoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyLoadingRouteArgs>(
        orElse: () => const MyLoadingRouteArgs(),
      );
      return MyLoadingScreen(
        key: args.key,
        minimumDisplayDuration: args.minimumDisplayDuration,
        readiness: args.readiness,
        nextScreenBuilder: args.nextScreenBuilder,
      );
    },
  );
}

class MyLoadingRouteArgs {
  const MyLoadingRouteArgs({
    this.key,
    this.minimumDisplayDuration = const Duration(milliseconds: 3000),
    this.readiness,
    this.nextScreenBuilder = defaultNextScreen,
  });

  final Key? key;

  final Duration minimumDisplayDuration;

  final Future<void>? readiness;

  final WidgetBuilder nextScreenBuilder;

  @override
  String toString() {
    return 'MyLoadingRouteArgs{key: $key, minimumDisplayDuration: $minimumDisplayDuration, readiness: $readiness, nextScreenBuilder: $nextScreenBuilder}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyLoadingRouteArgs) return false;
    return key == other.key &&
        minimumDisplayDuration == other.minimumDisplayDuration &&
        readiness == other.readiness &&
        nextScreenBuilder == other.nextScreenBuilder;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      minimumDisplayDuration.hashCode ^
      readiness.hashCode ^
      nextScreenBuilder.hashCode;
}

/// generated route for
/// [MySettingsScreen]
class MySettingsRoute extends PageRouteInfo<void> {
  const MySettingsRoute({List<PageRouteInfo>? children})
    : super(MySettingsRoute.name, initialChildren: children);

  static const String name = 'MySettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MySettingsScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
