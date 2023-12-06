import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/models/models.dart';

part 'canvas_state.dart';
part 'canvas_event.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc() : super(const CanvasState()) {
    on<UpdateAllDrawings>(_updateAllDrawings);
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
}
