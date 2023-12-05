import 'package:flutter/material.dart';
import 'package:flutter_canvas/views/canvas_options/widgets/color_selector.dart';
import 'package:flutter_canvas/views/canvas_options/widgets/tool_selector.dart';

class CanvasOptions extends StatelessWidget {
  const CanvasOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    return Drawer(
      width: width * 0.3,
      backgroundColor: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ToolSelector(),
          ColorSelector(),
          Placeholder(),
        ],
      ),
    );
  }
}
