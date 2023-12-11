import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/zoom_cubit.dart';

class Zoom extends StatelessWidget {
  const Zoom({super.key});

  @override
  Widget build(BuildContext context) {
    final zoomFactor = context.select((ZoomCubit zoomCubit) => zoomCubit.state);
    return Column(
      children: [
        const Text('Zoom'),
        Row(
          children: [
            const Text('Zoom Size'),
            Slider(
              value: zoomFactor,
              onChanged: (value) {
                context.read<ZoomCubit>().updateZoom(value);
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
