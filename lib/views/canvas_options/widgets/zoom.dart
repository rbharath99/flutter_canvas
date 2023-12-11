import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/canvas_options_cubit.dart';

class Zoom extends StatelessWidget {
  const Zoom({super.key});

  @override
  Widget build(BuildContext context) {
    final zoomFactor =
        context.select((CanvasOptionsCubit cubit) => cubit.state.zoomFactor);
    return Column(
      children: [
        const Text('Zoom'),
        Row(
          children: [
            const Text('Zoom Size'),
            Slider(
              value: zoomFactor,
              onChanged: (value) {
                context.read<CanvasOptionsCubit>().updateZoom(value);
              },
              min: 1,
              max: 5,
            ),
          ],
        ),
      ],
    );
  }
}
