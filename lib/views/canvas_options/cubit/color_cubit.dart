import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.blue);

  void selectColor(Color selectedColor) {
    emit(selectedColor);
  }
}
