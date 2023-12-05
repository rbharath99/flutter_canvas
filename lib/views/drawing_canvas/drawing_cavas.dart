import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/color_cubit.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Offset> offsets = [];
  @override
  Widget build(BuildContext context) {
    final selectedColor = context.read<ColorCubit>().state;
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
              painter: SketchPainter(
                offsets: offsets,
                selectedColor: selectedColor,
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
    required this.offsets,
    required this.selectedColor,
  });

  final List<Offset> offsets;
  final Color selectedColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = selectedColor;
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
