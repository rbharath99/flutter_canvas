import 'package:flutter/material.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Offset> offsets = [];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.precise,
      child: Listener(
        onPointerDown: (details) {
          setState(() {});
        },
        onPointerMove: (details) {
          setState(() {
            offsets.add(details.position);
          });
        },
        onPointerUp: (_) {
          setState(() {});
        },
        child: RepaintBoundary(
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: CustomPaint(
              painter: SketchPainter(offsets: offsets),
            ),
          ),
        ),
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  const SketchPainter({required this.offsets});

  final List<Offset> offsets;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.stroke;
    final path = Path();
    for (int i = 0; i < offsets.length - 1; i++) {
      path.moveTo(offsets[i].dx, offsets[i].dy);
      path.quadraticBezierTo(
        offsets[i].dx,
        offsets[i].dy,
        (offsets[i].dx + offsets[i + 1].dx) / 2,
        (offsets[i].dy + offsets[i + 1].dy) / 2,
      );
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
