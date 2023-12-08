part of 'canvas_bloc.dart';

class CanvasState extends Equatable {
  const CanvasState({
    this.allDrawings = const [],
    this.undoStack = const [],
    this.redoStack = const [],
    this.position = Offset.zero,
  });

  final List<Drawing> allDrawings;
  final List<Drawing> undoStack;
  final List<Drawing> redoStack;
  final Offset position;

  CanvasState copyWith({
    List<Drawing>? allDrawings,
    List<Drawing>? undoStack,
    List<Drawing>? redoStack,
    Offset? position,
  }) {
    return CanvasState(
      allDrawings: allDrawings ?? this.allDrawings,
      undoStack: undoStack ?? this.undoStack,
      redoStack: redoStack ?? this.redoStack,
      position: position ?? this.position,
    );
  }

  @override
  List<Object> get props => [
        allDrawings,
        undoStack,
        redoStack,
        position,
      ];
}
