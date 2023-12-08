import 'package:flutter/material.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Icon getToolIcon(ToolType tool) {
  switch (tool) {
    case ToolType.pencil:
      return const Icon(Icons.edit);
    case ToolType.line:
      return const Icon(Icons.straighten);
    case ToolType.polygon:
      return const Icon(FontAwesomeIcons.shapes);
    case ToolType.eraser:
      return const Icon(FontAwesomeIcons.eraser);
    case ToolType.square:
      return const Icon(Icons.crop_square);
    case ToolType.circle:
      return const Icon(Icons.circle);
  }
}
