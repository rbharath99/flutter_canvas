import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:flutter_canvas/models/models.dart';

class SketchPainter extends CustomPainter {
  const SketchPainter({
    required this.drawings,
  });

  final List<Drawing?> drawings;

  @override
  void paint(Canvas canvas, Size size) {
    for (final drawing in drawings) {
      final points = drawing!.points;
      final toolType = drawing.toolType;
      final paint = drawing.paint;
      if (points.isEmpty) return;
      final path = Path();
      path.moveTo(points.first.dx, points.first.dy);
      if (points.length < 2) {
        path.addOval(
          Rect.fromCircle(
            center: Offset(points[0].dx, points[0].dy),
            radius: 1,
          ),
        );
      }
      for (int i = 1; i < points.length - 1; ++i) {
        final p0 = points[i];
        final p1 = points[i + 1];
        path.quadraticBezierTo(
          p0.dx,
          p0.dy,
          (p0.dx + p1.dx) / 2,
          (p0.dy + p1.dy) / 2,
        );
      }
      Offset firstPoint = drawing.points.first;
      Offset lastPoint = drawing.points.last;
      Rect rect = Rect.fromPoints(firstPoint, lastPoint);
      Offset centerPoint = (firstPoint / 2) + (lastPoint / 2);
      double radius = (firstPoint - lastPoint).distance / 2;
      if (toolType == ToolType.pencil) {
        canvas.drawPath(path, paint);
      } else if (toolType == ToolType.square) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(5)),
          paint,
        );
      } else if (toolType == ToolType.line) {
        canvas.drawLine(firstPoint, lastPoint, paint);
      } else if (toolType == ToolType.circle) {
        canvas.drawOval(rect, paint);
      } else if (toolType == ToolType.eraser) {
        paint.blendMode = BlendMode.clear;
        paint.color = Colors.transparent;
        canvas.drawPath(path, paint);
      } else if (toolType == ToolType.polygon) {
        Path polygonPath = Path();
        int sides = drawing.sides;
        var angle = (math.pi * 2) / sides;
        double radian = 0.0;
        Offset startPoint =
            Offset(radius * math.cos(radian), radius * math.sin(radian));
        polygonPath.moveTo(
          startPoint.dx + centerPoint.dx,
          startPoint.dy + centerPoint.dy,
        );
        for (int i = 1; i <= sides; i++) {
          double x = radius * math.cos(radian + angle * i) + centerPoint.dx;
          double y = radius * math.sin(radian + angle * i) + centerPoint.dy;
          polygonPath.lineTo(x, y);
        }
        polygonPath.close();
        canvas.drawPath(polygonPath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as SketchPainter).drawings != drawings;
  }
}
