import 'package:flutter_bloc/flutter_bloc.dart';

class PolygonSidesCubit extends Cubit<int> {
  PolygonSidesCubit() : super(3);

  void updatePolygonSides(int updatedSides) {
    emit(updatedSides);
  }
}
