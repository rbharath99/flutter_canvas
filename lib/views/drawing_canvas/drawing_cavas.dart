import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:flutter_canvas/models/drawing.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/color_cubit.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/polygon_sides_cubit.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/size_cubit.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/tool_cubit.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Drawing?> drawings = [];

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        context.select((ColorCubit colorCubit) => colorCubit.state);
    final selectedTool =
        context.select((ToolCubit toolCubit) => toolCubit.state);
    final toolSize = context.select((SizeCubit sizeCubit) => sizeCubit.state);
    final polygonSides = context.select(
        (PolygonSidesCubit polygonSidesCubit) => polygonSidesCubit.state);
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
                toolType: selectedTool,
                sides: polygonSides,
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
                toolType: selectedTool,
                sides: polygonSides,
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
      final toolType = drawings[i]?.toolType;
      if (current != null && next != null) {
        if (toolType == ToolType.pencil || toolType == ToolType.line) {
          canvas.drawLine(current.offset, next.offset, current.paint);
        }
        if (toolType == ToolType.circle) {
          final radius = (current.offset - next.offset).distance / 2;
          final center = Offset((current.offset.dx + next.offset.dx) / 2,
              (current.offset.dy + next.offset.dy) / 2);
          canvas.drawCircle(center, radius, current.paint);
        }
        if (toolType == ToolType.polygon) {
          // TODO: create slider to select number of sides
        }
        if (toolType == ToolType.square) {
          final rect = Rect.fromPoints(current.offset, next.offset);
          canvas.drawRRect(
            RRect.fromRectAndRadius(rect, const Radius.circular(5)),
            current.paint,
          );
        }
        if (toolType == ToolType.eraser) {
          canvas.save();
          current.paint.blendMode = BlendMode.clear;
          current.paint.color = Colors.transparent;
          canvas.drawLine(current.offset, next.offset, current.paint);
          canvas.restore();
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
