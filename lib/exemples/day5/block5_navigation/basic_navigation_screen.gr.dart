// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'basic_navigation_screen.dart';

/// generated route for
/// [BasicDetailScreen]
class BasicDetailRoute extends PageRouteInfo<BasicDetailRouteArgs> {
  BasicDetailRoute({
    Key? key,
    required int itemId,
    List<PageRouteInfo>? children,
  }) : super(
         BasicDetailRoute.name,
         args: BasicDetailRouteArgs(key: key, itemId: itemId),
         initialChildren: children,
       );

  static const String name = 'BasicDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BasicDetailRouteArgs>();
      return BasicDetailScreen(key: args.key, itemId: args.itemId);
    },
  );
}

class BasicDetailRouteArgs {
  const BasicDetailRouteArgs({this.key, required this.itemId});

  final Key? key;

  final int itemId;

  @override
  String toString() {
    return 'BasicDetailRouteArgs{key: $key, itemId: $itemId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BasicDetailRouteArgs) return false;
    return key == other.key && itemId == other.itemId;
  }

  @override
  int get hashCode => key.hashCode ^ itemId.hashCode;
}

/// generated route for
/// [BasicHomeScreen]
class BasicHomeRoute extends PageRouteInfo<void> {
  const BasicHomeRoute({List<PageRouteInfo>? children})
    : super(BasicHomeRoute.name, initialChildren: children);

  static const String name = 'BasicHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BasicHomeScreen();
    },
  );
}
