import 'package:flutter/material.dart';
import 'package:flutter_canvas/enum/tool_type.dart';

class Drawing {
  Drawing({
    required this.offset,
    required this.points,
    required this.paint,
    required this.toolType,
    this.sides = 3,
  });
  final Offset offset;
  final List<Offset> points;
  final Paint paint;
  final ToolType toolType;
  final int sides;

  static Drawing empty = Drawing(
    offset: Offset.zero,
    points: List.empty(),
    paint: Paint(),
    toolType: ToolType.pencil,
  );

  @override
  String toString() {
    return '''$offset $points $paint $sides''';
  }
}
