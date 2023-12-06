import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/utils/sketch_painter.dart';
import 'package:flutter_canvas/views/drawing_canvas/bloc/canvas_bloc.dart';

class AllSketches extends StatefulWidget {
  const AllSketches({super.key});

  @override
  State<AllSketches> createState() => _AllSketchesState();
}

class _AllSketchesState extends State<AllSketches> {
  @override
  Widget build(BuildContext context) {
    final allDrawings =
        context.select((CanvasBloc canvasBloc) => canvasBloc.state.allDrawings);
    return Listener(
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
    );
  }
}
