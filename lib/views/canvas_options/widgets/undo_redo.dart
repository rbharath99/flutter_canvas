import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/drawing_canvas/bloc/canvas_bloc.dart';

class UndoRedo extends StatelessWidget {
  const UndoRedo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Undo/Redo'),
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<CanvasBloc>().add(Undo());
              },
              child: const Text('Undo'),
            ),
            TextButton(
              onPressed: () {
                context.read<CanvasBloc>().add(Redo());
              },
              child: const Text('Redo'),
            ),
          ],
        ),
      ],
    );
  }
}
