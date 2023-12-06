import 'package:flutter/material.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:flutter_canvas/views/canvas_options/widgets/widgets.dart';
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
              toolType: ToolType.pencil,
            ),
            ToolBox(
              iconData: FontAwesomeIcons.rulerHorizontal,
              tooltip: 'Line',
              toolType: ToolType.line,
            ),
            ToolBox(
              iconData: Icons.hexagon_outlined,
              tooltip: 'Polygon',
              toolType: ToolType.polygon,
            ),
            ToolBox(
              iconData: FontAwesomeIcons.eraser,
              tooltip: 'Eraser',
              toolType: ToolType.eraser,
            ),
            ToolBox(
              iconData: FontAwesomeIcons.square,
              tooltip: 'Square',
              toolType: ToolType.square,
            ),
            ToolBox(
              iconData: FontAwesomeIcons.circle,
              tooltip: 'Circle',
              toolType: ToolType.circle,
            ),
          ],
        ),
      ],
    );
  }
}
