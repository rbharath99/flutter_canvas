import 'package:flutter/material.dart';
import 'package:flutter_canvas/enum/tool_type.dart';

class Drawing {
  final Offset offset;
  final Paint paint;
  final ToolType toolType;
  final int sides;

  Drawing({
    required this.offset,
    required this.paint,
    required this.toolType,
    this.sides = 3,
  });
}
