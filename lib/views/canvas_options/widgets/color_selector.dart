import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/color_cubit.dart';
import 'package:flutter_canvas/views/canvas_options/widgets/widgets.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        context.select((ColorCubit colorCubit) => colorCubit.state);
    final colors = [Colors.black, Colors.white, ...Colors.primaries];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 2,
          runSpacing: 2,
          children: [
            for (final color in colors)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.read<ColorCubit>().selectColor(color);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                        color: color,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    border: Border.all(
                      color: selectedColor,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const ColorPickerDialog();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.colorize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
