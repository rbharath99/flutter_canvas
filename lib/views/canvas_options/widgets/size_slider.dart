import 'package:flutter/material.dart';

class SizeSlider extends StatelessWidget {
  const SizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Size'),
        Row(
          children: [
            const Text('Stroke Size'),
            Slider(
              value: 0,
              onChanged: (_) {},
            ),
          ],
        ),
        Row(
          children: [
            const Text('Eraser Size'),
            Slider(
              value: 0,
              onChanged: (_) {},
            ),
          ],
        ),
      ],
    );
  }
}
