import 'package:flutter/material.dart';
import 'package:flutter_canvas/views/canvas_options/widgets/tool_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolSelector extends StatelessWidget {
  const ToolSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Shapes'),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: [
            ToolBox(
              iconData: FontAwesomeIcons.pencil,
              tooltip: 'Pencil',
            ),
            ToolBox(
              iconData: FontAwesomeIcons.rulerHorizontal,
              tooltip: 'Line',
            ),
            ToolBox(
              iconData: Icons.hexagon_outlined,
              tooltip: 'Polygon',
            ),
            ToolBox(
              iconData: FontAwesomeIcons.eraser,
              tooltip: 'Eraser',
            ),
            ToolBox(
              iconData: FontAwesomeIcons.square,
              tooltip: 'Square',
            ),
            ToolBox(
              iconData: FontAwesomeIcons.circle,
              tooltip: 'Circle',
            ),
          ],
        ),
      ],
    );
  }
}
