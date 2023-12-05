import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/size_cubit.dart';

class SizeSlider extends StatelessWidget {
  const SizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final toolSize = context.select((SizeCubit sizeCubit) => sizeCubit.state);
    return Column(
      children: [
        const Text('Size'),
        Row(
          children: [
            const Text('Stroke Size'),
            Slider(
              value: toolSize.strokeSize,
              onChanged: (value) {
                context.read<SizeCubit>().updateSize('strokeSize', value);
              },
              max: 100,
            ),
          ],
        ),
        Row(
          children: [
            const Text('Eraser Size'),
            Slider(
              value: toolSize.eraserSize,
              onChanged: (value) {
                context.read<SizeCubit>().updateSize('eraserSize', value);
              },
              max: 100,
            ),
          ],
        ),
      ],
    );
  }
}
