import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/canvas_options_cubit.dart';

class PolygonSidesSlider extends StatelessWidget {
  const PolygonSidesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final polygonSides = context.select(
      (CanvasOptionsCubit cubit) => cubit.state.polygonSides,
    );
    return Column(
      children: [
        const Text('Sides'),
        Row(
          children: [
            const Text('Polygon Size'),
            Slider(
              min: 3,
              max: 10,
              divisions: 7,
              value: polygonSides.toDouble(),
              onChanged: (value) {
                context.read<CanvasOptionsCubit>().updatePolygonSides(
                      value.toInt(),
                    );
              },
            ),
          ],
        ),
      ],
    );
  }
}
