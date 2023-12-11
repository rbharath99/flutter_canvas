import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/canvas_options_cubit.dart';

class SizeSlider extends StatelessWidget {
  const SizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final strokeSize =
        context.select((CanvasOptionsCubit cubit) => cubit.state.strokeSize);
    final eraserSize =
        context.select((CanvasOptionsCubit cubit) => cubit.state.eraserSize);
    return Column(
      children: [
        const Text('Size'),
        Row(
          children: [
            const Text('Stroke Size'),
            Slider(
              value: strokeSize,
              onChanged: (value) {
                context.read<CanvasOptionsCubit>().updateStrokeSize(value);
              },
              max: 100,
            ),
          ],
        ),
        Row(
          children: [
            const Text('Eraser Size'),
            Slider(
              value: eraserSize,
              onChanged: (value) {
                context.read<CanvasOptionsCubit>().updateEraserSize(value);
              },
              max: 100,
            ),
          ],
        ),
      ],
    );
  }
}
