part of 'canvas_bloc.dart';

class CanvasState extends Equatable {
  const CanvasState({
    this.allDrawings = const [],
    this.undoStack = const [],
    this.redoStack = const [],
  });

  final List<Drawing> allDrawings;
  final List<Drawing> undoStack;
  final List<Drawing> redoStack;

  CanvasState copyWith({
    List<Drawing>? allDrawings,
    List<Drawing>? undoStack,
    List<Drawing>? redoStack,
  }) {
    return CanvasState(
      allDrawings: allDrawings ?? this.allDrawings,
      undoStack: undoStack ?? this.undoStack,
      redoStack: redoStack ?? this.redoStack,
    );
  }

  @override
  List<Object> get props => [
        allDrawings,
        undoStack,
        redoStack,
      ];
}
