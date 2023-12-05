import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/models/drawing.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/color_cubit.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/size_cubit.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Drawing?> drawings = [];

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.read<ColorCubit>().state;
    final toolSize = context.select((SizeCubit sizeCubit) => sizeCubit.state);
    return MouseRegion(
      cursor: SystemMouseCursors.precise,
      child: Listener(
        onPointerDown: (details) {
          setState(() {
            drawings.add(
              Drawing(
                offset: details.localPosition,
                paint: Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = toolSize.strokeSize
                  ..strokeCap = StrokeCap.round
                  ..style = PaintingStyle.stroke,
              ),
            );
          });
        },
        onPointerMove: (details) {
          setState(() {
            drawings.add(
              Drawing(
                offset: details.localPosition,
                paint: Paint()
                  ..color = selectedColor
                  ..isAntiAlias = true
                  ..strokeWidth = toolSize.strokeSize
                  ..strokeCap = StrokeCap.round
                  ..style = PaintingStyle.stroke,
              ),
            );
          });
        },
        onPointerUp: (_) {
          setState(() {
            drawings.add(null);
          });
        },
        child: RepaintBoundary(
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: CustomPaint(
              painter: SketchPainter(
                drawings: drawings,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  const SketchPainter({
    required this.drawings,
  });

  final List<Drawing?> drawings;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawings.length - 1; i++) {
      final current = drawings[i];
      final next = drawings[i + 1];
      if (current != null && next != null) {
        canvas.drawLine(current.offset, next.offset, current.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
