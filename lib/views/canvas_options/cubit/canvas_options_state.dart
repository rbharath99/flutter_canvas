part of 'canvas_options_cubit.dart';

class CanvasOptionsState extends Equatable {
  const CanvasOptionsState({
    this.polygonSides = 3,
    this.zoomFactor = 1,
    this.strokeSize = 0,
    this.eraserSize = 0,
    this.toolType = ToolType.pencil,
    this.color = Colors.blue,
  });

  final int polygonSides;
  final double zoomFactor;
  final double strokeSize;
  final double eraserSize;
  final ToolType toolType;
  final Color color;

  CanvasOptionsState copyWith({
    int? polygonSides,
    double? zoomFactor,
    double? strokeSize,
    double? eraserSize,
    ToolType? toolType,
    Color? color,
  }) {
    return CanvasOptionsState(
      polygonSides: polygonSides ?? this.polygonSides,
      zoomFactor: zoomFactor ?? this.zoomFactor,
      strokeSize: strokeSize ?? this.strokeSize,
      eraserSize: eraserSize ?? this.eraserSize,
      toolType: toolType ?? this.toolType,
      color: color ?? this.color,
    );
  }

  @override
  List<Object> get props => [
        polygonSides,
        zoomFactor,
        strokeSize,
        eraserSize,
        toolType,
        color,
      ];
}
