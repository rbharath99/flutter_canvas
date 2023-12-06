part of 'canvas_bloc.dart';

class CanvasState extends Equatable {
  const CanvasState({
    this.allDrawings = const [],
  });

  final List<Drawing> allDrawings;

  CanvasState copyWith({
    List<Drawing>? allDrawings,
  }) {
    return CanvasState(
      allDrawings: allDrawings ?? this.allDrawings,
    );
  }

  @override
  List<Object> get props => [allDrawings];
}
