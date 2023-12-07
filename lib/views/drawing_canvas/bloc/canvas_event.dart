part of 'canvas_bloc.dart';

abstract class CanvasEvent extends Equatable {
  const CanvasEvent();

  @override
  List<Object> get props => [];
}

class UpdateAllDrawings extends CanvasEvent {
  const UpdateAllDrawings({required this.drawing});

  final Drawing drawing;

  @override
  List<Object> get props => [drawing];
}

class Undo extends CanvasEvent {}

class Redo extends CanvasEvent {}
