import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/models/models.dart';
import 'package:flutter_canvas/utils/sketch_painter.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/cubits.dart';
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
        context.select((ColorCubit colorCubit) => colorCubit.state);
    final selectedTool =
        context.select((ToolCubit toolCubit) => toolCubit.state);
    final toolSize = context.select((SizeCubit sizeCubit) => sizeCubit.state);
    final polygonSides = context.select(
      (PolygonSidesCubit polygonSidesCubit) => polygonSidesCubit.state,
    );
    final zoomFactor = context.select((ZoomCubit zoomCubit) => zoomCubit.state);
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
                ..strokeWidth = toolSize.strokeSize
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
                ..strokeWidth = toolSize.strokeSize
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
                ..strokeWidth = toolSize.strokeSize
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
