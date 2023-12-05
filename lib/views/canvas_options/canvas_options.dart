import 'package:flutter/material.dart';

class CanvasOptions extends StatelessWidget {
  const CanvasOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    return Drawer(
      width: width * 0.3,
      backgroundColor: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
    );
  }
}
