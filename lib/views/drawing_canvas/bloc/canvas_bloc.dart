import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/models/models.dart';

part 'canvas_state.dart';
part 'canvas_event.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc() : super(const CanvasState()) {
    on<UpdateAllDrawings>(_updateAllDrawings);
    on<Undo>(_onUndo);
    on<Redo>(_onRedo);
  }

  FutureOr<void> _updateAllDrawings(
    UpdateAllDrawings event,
    Emitter<CanvasState> emit,
  ) {
    final drawing = event.drawing;
    final updatedDrawings = List<Drawing>.from(state.allDrawings)..add(drawing);
    emit(
      state.copyWith(
        allDrawings: updatedDrawings,
      ),
    );
  }

  void _onUndo(
    Undo event,
    Emitter<CanvasState> emit,
  ) {
    final allDrawings = List<Drawing>.from(state.allDrawings);
    final lastDrawing = allDrawings.removeLast();
    final updatedUndoStack = List<Drawing>.from(state.undoStack)
      ..add(lastDrawing);
    emit(
      state.copyWith(
        allDrawings: allDrawings,
        undoStack: updatedUndoStack,
      ),
    );
  }

  void _onRedo(
    Redo event,
    Emitter<CanvasState> emit,
  ) {
    final undos = List<Drawing>.from(state.undoStack);
    final lastUndo = undos.removeLast();
    final allDrawings = List<Drawing>.from(state.allDrawings)..add(lastUndo);
    emit(
      state.copyWith(
        allDrawings: allDrawings,
        undoStack: undos,
      ),
    );
  }
}
