import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:flutter_canvas/models/models.dart';
import 'package:flutter_canvas/utils/sketch_painter.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/canvas_options_cubit.dart';
import 'package:flutter_canvas/views/drawing_canvas/bloc/canvas_bloc.dart';

class CurrentSketch extends StatefulWidget {
  const CurrentSketch({super.key});

  @override
  State<CurrentSketch> createState() => _CurrentSketchState();
}

class _CurrentSketchState extends State<CurrentSketch> {
  Drawing drawing = Drawing.empty;

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        context.select((CanvasOptionsCubit cubit) => cubit.state.color);
    final selectedTool =
        context.select((CanvasOptionsCubit cubit) => cubit.state.toolType);
    final strokeSize =
        context.select((CanvasOptionsCubit cubit) => cubit.state.strokeSize);
    final eraserSize =
        context.select((CanvasOptionsCubit cubit) => cubit.state.eraserSize);
    final polygonSides = context.select(
      (CanvasOptionsCubit cubit) => cubit.state.polygonSides,
    );
    final zoomFactor =
        context.select((CanvasOptionsCubit cubit) => cubit.state.zoomFactor);
    return Transform.scale(
      scale: zoomFactor,
      child: Listener(
        onPointerDown: (details) {
          setState(() {
            final offset = Offset(
              details.localPosition.dx,
              details.localPosition.dy,
            );
            drawing = Drawing(
              offset: offset,
              paint: Paint()
                ..color = selectedColor
                ..isAntiAlias = true
                ..strokeWidth =
                    selectedTool != ToolType.eraser ? strokeSize : eraserSize
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
              toolType: selectedTool,
              sides: polygonSides,
              points: [offset],
            );
          });
        },
        onPointerMove: (details) {
          setState(() {
            final offset = Offset(
              details.localPosition.dx,
              details.localPosition.dy,
            );
            final newPoints = List<Offset>.from(drawing.points)..add(offset);
            drawing = Drawing(
              offset: offset,
              paint: Paint()
                ..color = selectedColor
                ..isAntiAlias = true
                ..strokeWidth =
                    selectedTool != ToolType.eraser ? strokeSize : eraserSize
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
              toolType: selectedTool,
              sides: polygonSides,
              points: newPoints,
            );
          });
        },
        onPointerUp: (details) {
          setState(() {
            final offset = Offset(
              details.localPosition.dx,
              details.localPosition.dy,
            );
            context.read<CanvasBloc>().add(UpdateAllDrawings(drawing: drawing));
            drawing = Drawing(
              offset: offset,
              paint: Paint()
                ..color = selectedColor
                ..isAntiAlias = true
                ..strokeWidth =
                    selectedTool != ToolType.eraser ? strokeSize : eraserSize
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
              toolType: selectedTool,
              sides: polygonSides,
              points: [],
            );
          });
        },
        child: RepaintBoundary(
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: CustomPaint(
              painter: SketchPainter(
                drawings: [drawing],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
