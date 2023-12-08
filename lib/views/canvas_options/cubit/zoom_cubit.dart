import 'package:flutter_bloc/flutter_bloc.dart';

class ZoomCubit extends Cubit<double> {
  ZoomCubit() : super(1);

  void updateZoom(double updatedZoom) {
    emit(updatedZoom);
  }
}
