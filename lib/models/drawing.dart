import 'package:flutter/material.dart';
import 'package:flutter_canvas/enum/tool_type.dart';

class Drawing {
  Offset offset;
  Paint paint;
  ToolType toolType;

  Drawing({
    required this.offset,
    required this.paint,
    required this.toolType,
  });
}
