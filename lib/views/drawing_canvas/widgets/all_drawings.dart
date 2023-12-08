import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/utils/sketch_painter.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/cubits.dart';
import 'package:flutter_canvas/views/drawing_canvas/bloc/canvas_bloc.dart';

class AllSketches extends StatelessWidget {
  const AllSketches({super.key});

  @override
  Widget build(BuildContext context) {
    final allDrawings =
        context.select((CanvasBloc canvasBloc) => canvasBloc.state.allDrawings);
    final zoomFactor = context.select((ZoomCubit zoomCubit) => zoomCubit.state);
    return Transform.scale(
      scale: zoomFactor,
      child: Listener(
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
