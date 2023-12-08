import 'package:flutter/material.dart';
import 'package:flutter_canvas/views/drawing_canvas/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  Offset pointer = Offset.zero;
  @override
  Widget build(BuildContext context) {
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
              top: pointer.dy,
              child: const Icon(FontAwesomeIcons.pen),
            ),
            const AllSketches(),
            const CurrentSketch(),
          ],
        ),
      ),
    );
  }
}
