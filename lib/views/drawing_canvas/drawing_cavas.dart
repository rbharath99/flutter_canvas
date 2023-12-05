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
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          offsets.add(details.globalPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => setState(() {}),
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: CustomPaint(
          painter: SketchPainter(offsets: offsets),
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
    paint.strokeWidth = 5.0;
    for (int i = 0; i < offsets.length - 1; i++) {
      final path = Path();
      path.moveTo(offsets[i].dx, offsets[i].dy);
      path.quadraticBezierTo(
        offsets[i].dx,
        offsets[i].dy,
        (offsets[i].dx + offsets[i + 1].dx) / 2,
        (offsets[i].dy + offsets[i + 1].dy) / 2,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
