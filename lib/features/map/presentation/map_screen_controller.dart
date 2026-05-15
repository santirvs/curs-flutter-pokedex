import 'dart:math' as math;

import 'package:flutter/material.dart';

class MapScreenController {
  static const double initialMapFraction = 0.5;

  static Size layoutMapSize(Size viewportSize) {
    final desiredSide = viewportSize.shortestSide / initialMapFraction;
    final side = math.max(desiredSide, viewportSize.longestSide);
    return Size(side, side);
  }
}
