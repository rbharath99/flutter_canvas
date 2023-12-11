import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/views/canvas_options/cubit/canvas_options_cubit.dart';
import 'package:flutter_canvas/views/drawing_canvas/bloc/canvas_bloc.dart';
import 'package:flutter_canvas/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CanvasOptionsCubit(),
        ),
        BlocProvider(
          create: (context) => CanvasBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Whiteboard',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WhiteBoardCanvas(title: 'Flutter Whiteboard'),
      ),
    );
  }
}

class WhiteBoardCanvas extends StatelessWidget {
  const WhiteBoardCanvas({
    required this.title,
    super.key,
  });
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
