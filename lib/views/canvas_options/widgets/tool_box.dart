import 'package:flutter/material.dart';

class ToolBox extends StatelessWidget {
  const ToolBox({
    super.key,
    required this.iconData,
    required this.tooltip,
  });

  final IconData iconData;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
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
