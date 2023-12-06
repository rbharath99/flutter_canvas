import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/cubits.dart';

import 'views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Whiteboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ColorCubit(),
          ),
          BlocProvider(
            create: (context) => SizeCubit(),
          ),
          BlocProvider(
            create: (context) => ToolCubit(),
          ),
          BlocProvider(
            create: (context) => PolygonSidesCubit(),
          ),
        ],
        child: const WhiteBoardCanvas(title: 'Flutter Whiteboard'),
      ),
    );
  }
}

class WhiteBoardCanvas extends StatelessWidget {
  const WhiteBoardCanvas({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CanvasOptions(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const DrawingCanvas(),
    );
  }
}
