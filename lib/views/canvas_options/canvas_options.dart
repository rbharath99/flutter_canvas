import 'package:flutter/material.dart';
import 'package:flutter_canvas/views/canvas_options/widgets/widgets.dart';

class CanvasOptions extends StatelessWidget {
  const CanvasOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    return Drawer(
      width: width * 0.3,
      backgroundColor: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ToolSelector(),
            PolygonSidesSlider(),
            ColorSelector(),
            SizeSlider(),
          ],
        ),
      ),
    );
  }
}
