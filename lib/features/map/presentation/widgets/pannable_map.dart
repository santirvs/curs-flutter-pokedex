import 'package:flutter/material.dart';

class PannableMap extends StatefulWidget {
  const PannableMap({
    super.key,
    required this.mapSize,
    required this.viewportSize,
    required this.child,
  });

  final Size mapSize;
  final Size viewportSize;
  final Widget child;

  @override
  State<PannableMap> createState() => _PannableMapState();
}

class _PannableMapState extends State<PannableMap> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final maxX = (widget.mapSize.width - widget.viewportSize.width).clamp(
      0.0,
      double.infinity,
    );
    final maxY = (widget.mapSize.height - widget.viewportSize.height).clamp(
      0.0,
      double.infinity,
    );

    final clamped = Offset(
      _offset.dx.clamp(-maxX, 0.0),
      _offset.dy.clamp(-maxY, 0.0),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanUpdate: (details) {
        setState(() {
          _offset = Offset(
            (clamped.dx + details.delta.dx).clamp(-maxX, 0.0),
            (clamped.dy + details.delta.dy).clamp(-maxY, 0.0),
          );
        });
      },
      child: ClipRect(
        child: SizedBox.expand(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                left: clamped.dx,
                top: clamped.dy,
                width: widget.mapSize.width,
                height: widget.mapSize.height,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
