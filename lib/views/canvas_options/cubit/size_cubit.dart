import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/models/tool_size.dart';

class SizeCubit extends Cubit<ToolSize> {
  SizeCubit() : super(ToolSize(strokeSize: 0.0, eraserSize: 0.0));

  void updateSize(String key, double value) {
    final newState = ToolSize(
      strokeSize: key == 'strokeSize' ? value : state.strokeSize,
      eraserSize: key == 'eraserSize' ? value : state.eraserSize,
    );
    emit(newState);
  }
}
