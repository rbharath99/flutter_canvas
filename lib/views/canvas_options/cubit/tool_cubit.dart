import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_canvas/enum/tool_type.dart';

class ToolCubit extends Cubit<ToolType> {
  ToolCubit() : super(ToolType.pencil);

  void updateToolType(ToolType selectedTool) {
    emit(selectedTool);
  }
}
