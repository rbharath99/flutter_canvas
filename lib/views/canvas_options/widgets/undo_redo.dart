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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: 'Undo',
              child: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.undo),
                onPressed: () {
                  context.read<CanvasBloc>().add(Undo());
                },
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: const BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Tooltip(
              message: 'Redo',
              child: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.redo),
                onPressed: () {
                  context.read<CanvasBloc>().add(Redo());
                },
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  side: const BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
