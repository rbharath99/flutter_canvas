import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/models/models.dart';

class SizeCubit extends Cubit<ToolSize> {
  SizeCubit() : super(ToolSize(strokeSize: 0, eraserSize: 0));

  void updateSize(String key, double value) {
    final newState = ToolSize(
      strokeSize: key == 'strokeSize' ? value : state.strokeSize,
      eraserSize: key == 'eraserSize' ? value : state.eraserSize,
    );
    emit(newState);
  }
}
