import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/utils/tool_to_cursor.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/cubits.dart';
import 'package:flutter_canvas/views/drawing_canvas/widgets/widgets.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  Offset pointer = Offset.zero;
  static const topDelta = 80;
  @override
  Widget build(BuildContext context) {
    final selectedTool =
        context.select((ToolCubit toolCubit) => toolCubit.state);
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      child: Listener(
        onPointerHover: (details) {
          setState(() {
            pointer = details.position;
          });
        },
        onPointerDown: (details) {
          setState(() {
            pointer = details.position;
          });
        },
        onPointerMove: (details) {
          setState(() {
            pointer = details.position;
          });
        },
        onPointerUp: (details) {
          setState(() {
            pointer = details.position;
          });
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 5,
              ),
              left: pointer.dx,
              top: pointer.dy - topDelta,
              child: getToolIcon(selectedTool),
            ),
            const AllSketches(),
            const CurrentSketch(),
          ],
        ),
      ),
    );
  }
}
