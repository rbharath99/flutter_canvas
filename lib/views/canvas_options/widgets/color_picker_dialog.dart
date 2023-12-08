import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/color_cubit.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        context.select((ColorCubit colorCubit) => colorCubit.state);
    return AlertDialog(
      title: const Text('Pick A Color!'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: selectedColor,
          onColorChanged: (newColor) {
            context.read<ColorCubit>().selectColor(newColor);
          },
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Done'),
          onPressed: () {
            context.read<ColorCubit>().selectColor(selectedColor);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
