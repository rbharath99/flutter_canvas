import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:flutter_canvas/models/models.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/cubits.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  Drawing drawing = Drawing.empty;
  List<Offset> points = List.empty();
  List<Drawing> allDrawings = [];

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
            final newPoints = List<Offset>.from(drawing.points);
            final offset = Offset(
              details.localPosition.dx,
              details.localPosition.dy,
            );
            newPoints.add(offset);
            drawing = Drawing(
              offset: offset,
              paint: Paint()
                ..color = selectedColor
                ..isAntiAlias = true
                ..strokeWidth = toolSize.strokeSize
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
              toolType: selectedTool,
              sides: polygonSides,
              points: newPoints,
            );
          });
        },
        onPointerMove: (details) {
          setState(() {
            final offset = Offset(
              details.localPosition.dx,
              details.localPosition.dy,
            );
            final newPoints = List<Offset>.from(drawing.points);
            newPoints.add(offset);
            drawing = (Drawing(
              offset: offset,
              paint: Paint()
                ..color = selectedColor
                ..isAntiAlias = true
                ..strokeWidth = toolSize.strokeSize
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
              toolType: selectedTool,
              sides: polygonSides,
              points: newPoints,
            ));
          });
        },
        onPointerUp: (details) {
          setState(() {
            allDrawings = List.from(allDrawings)..add(drawing);
            drawing = (Drawing(
              offset: details.localPosition,
              paint: Paint()
                ..color = selectedColor
                ..isAntiAlias = true
                ..strokeWidth = toolSize.strokeSize
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
              toolType: selectedTool,
              sides: polygonSides,
              points: List.empty(),
            ));
          });
        },
        child: RepaintBoundary(
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: CustomPaint(
              painter: SketchPainter(
                drawings: allDrawings,
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
    for (final drawing in drawings) {
      final paint = drawing!.paint;
      final toolType = drawing.toolType;
      final d1 = drawing.points.first;
      final d2 = drawing.points.last;
      final radius = (d1 - d2).distance / 2;
      final center = Offset((d1.dx + d2.dx) / 2, (d1.dy + d2.dy) / 2);
      if (toolType == ToolType.circle) {
        canvas.drawCircle(center, radius, paint);
      } else if (toolType == ToolType.line) {
        canvas.drawLine(d1, d2, paint);
      } else if (toolType == ToolType.square) {
        final rect = Rect.fromPoints(d1, d2);
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(0)),
          paint,
        );
      } else if (toolType == ToolType.polygon) {
        final polygonPath = Path();
        final sides = drawing.sides;
        final angle = (math.pi * 2) / sides;
        const radian = 0;
        final startPoint =
            Offset(radius * math.cos(radian), radius * math.sin(radian));

        polygonPath.moveTo(
          startPoint.dx + center.dx,
          startPoint.dy + center.dy,
        );

        for (int i = 1; i <= sides; i++) {
          final x = radius * math.cos(radian + angle * i) + center.dx;
          final y = radius * math.sin(radian + angle * i) + center.dy;
          polygonPath.lineTo(x, y);
        }

        polygonPath.close();
        canvas.drawPath(polygonPath, paint);
      } else if (toolType == ToolType.pencil) {
        for (int i = 0; i < drawing.points.length - 1; i++) {
          final current = drawing.points[i];
          final next = drawing.points[i + 1];
          canvas.drawLine(current, next, paint);
        }
      } else if (toolType == ToolType.eraser) {
        for (int i = 0; i < drawing.points.length - 1; i++) {
          final current = drawing.points[i];
          final next = drawing.points[i + 1];
          canvas.save();
          paint.blendMode = BlendMode.clear;
          paint.color = Colors.transparent;
          canvas.drawLine(current, next, paint);
          canvas.restore();
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
