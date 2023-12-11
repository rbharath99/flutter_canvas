import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/utils/tool_to_cursor.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/canvas_options_cubit.dart';
import 'package:flutter_canvas/views/drawing_canvas/bloc/canvas_bloc.dart';
import 'package:flutter_canvas/views/drawing_canvas/widgets/widgets.dart';

class DrawingCanvas extends StatelessWidget {
  const DrawingCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    const topDelta = 80;
    final selectedTool =
        context.select((CanvasOptionsCubit cubit) => cubit.state.toolType);
    final pointer =
        context.select((CanvasBloc canvasBloc) => canvasBloc.state.position);
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      child: Listener(
        onPointerHover: (details) {
          context
              .read<CanvasBloc>()
              .add(UpdateCursorPosition(details: details));
        },
        onPointerDown: (details) {
          context
              .read<CanvasBloc>()
              .add(UpdateCursorPosition(details: details));
        },
        onPointerMove: (details) {
          context
              .read<CanvasBloc>()
              .add(UpdateCursorPosition(details: details));
        },
        onPointerUp: (details) {
          context
              .read<CanvasBloc>()
              .add(UpdateCursorPosition(details: details));
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 1,
              ),
              left: pointer.dx,
              top: pointer.dy - topDelta,
              child: getToolIcon(selectedTool),
            ),
            const AllSketches(),
            const CurrentSketch(),
          ],
        ),
      ),
    );
  }
}
