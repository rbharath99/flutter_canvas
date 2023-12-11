import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/enum/tool_type.dart';

part 'canvas_options_state.dart';

class CanvasOptionsCubit extends Cubit<CanvasOptionsState> {
  CanvasOptionsCubit() : super(const CanvasOptionsState());

  void updatePolygonSides(int updatedSides) {
    emit(state.copyWith(polygonSides: updatedSides));
  }

  void selectColor(Color selectedColor) {
    emit(state.copyWith(color: selectedColor));
  }

  void updateToolType(ToolType selectedTool) {
    emit(state.copyWith(toolType: selectedTool));
  }

  void updateStrokeSize(double updatedStrokeSize) {
    emit(state.copyWith(strokeSize: updatedStrokeSize));
  }

  void updateEraserSize(double updatedEraserSize) {
    emit(state.copyWith(eraserSize: updatedEraserSize));
  }

  void updateZoom(double updatedZoom) {
    emit(state.copyWith(zoomFactor: updatedZoom));
  }
}
