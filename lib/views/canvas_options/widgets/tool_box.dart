import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/enum/tool_type.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/tool_cubit.dart';

class ToolBox extends StatelessWidget {
  const ToolBox({
    super.key,
    required this.iconData,
    required this.tooltip,
    required this.toolType,
  });

  final IconData iconData;
  final String tooltip;
  final ToolType toolType;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.read<ToolCubit>().updateToolType(toolType);
        },
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Tooltip(
            message: tooltip,
            child: Icon(
              iconData,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
