import 'package:flutter/material.dart';
import 'package:flutter_canvas/views/drawing_canvas/widgets/widgets.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  @override
  Widget build(BuildContext context) {
    return const MouseRegion(
      cursor: SystemMouseCursors.precise,
      child: Stack(
        children: [
          AllSketches(),
          CurrentSketch(),
        ],
      ),
    );
  }
}
