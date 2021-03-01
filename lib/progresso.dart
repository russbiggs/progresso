library progresso;

import 'package:flutter/material.dart';

class Progresso extends StatefulWidget {
  final double start;
  final double progress;
  final List<double> points;
  final Color progressColor;
  final Color backgroundColor;
  final double progressStrokeWidth;
  final StrokeCap progressStrokeCap;
  final double backgroundStrokeWidth;
  final StrokeCap backgroundStrokeCap;
  final Color pointColor;
  final Color pointInnerColor;
  final double pointRadius;
  final double pointInnerRadius;

  Progresso(
      {Key key,
      this.start = 0,
      this.progress,
      this.progressColor = Colors.blue,
      this.backgroundColor = Colors.grey,
      this.progressStrokeWidth = 10.0,
      this.backgroundStrokeWidth = 5.0,
      this.progressStrokeCap = StrokeCap.square,
      this.backgroundStrokeCap = StrokeCap.square,
      this.pointColor = Colors.blue,
      this.pointInnerColor = Colors.white,
      this.pointRadius = 7.5,
      this.pointInnerRadius = 2.5,
      this.points = const []})
      : super(key: key);

  @override
  _ProgressoState createState() => _ProgressoState();
}

class _ProgressoState extends State<Progresso> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: ProgressoPainter(
            progress: widget.progress,
            start: widget.start,
            progressColor: widget.progressColor,
            backgroundColor: widget.backgroundColor,
            progressStrokeWidth: widget.progressStrokeWidth,
            progressStrokeCap: widget.progressStrokeCap,
            backgroundStrokeWidth : widget.backgroundStrokeWidth,
            backgroundStrokeCap : widget.backgroundStrokeCap,
            pointColor: widget.pointColor,
            pointInnerColor: widget.pointInnerColor,
            pointRadius: widget.pointRadius,
            pointInnerRadius: widget.pointInnerRadius,
            points: widget.points),
        child: Center());
  }
}

class ProgressoPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintProgress = new Paint();
  final Paint _paintPoint = new Paint();
  final Paint _paintPointCenter = new Paint();
  final Color backgroundColor;
  final Color progressColor;
  final double start;
  final double progress;
  final double progressStrokeWidth;
  final StrokeCap progressStrokeCap;
  final double backgroundStrokeWidth;
  final StrokeCap backgroundStrokeCap;
  final Color pointColor;
  final Color pointInnerColor;
  final double pointRadius;
  final double pointInnerRadius;
  final List<double> points;

  ProgressoPainter(
      {this.start,
      this.progress,
      this.progressColor,
      this.backgroundColor,
      this.progressStrokeWidth,
      this.progressStrokeCap,
      this.backgroundStrokeWidth,
      this.backgroundStrokeCap,
      this.points,
      this.pointColor,
      this.pointInnerColor,
      this.pointInnerRadius,
      this.pointRadius}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeCap = backgroundStrokeCap;
    _paintBackground.strokeWidth = backgroundStrokeWidth;
    _paintProgress.color = progressColor;
    _paintProgress.style = PaintingStyle.stroke;
    _paintProgress.strokeCap = progressStrokeCap;
    _paintProgress.strokeWidth = progressStrokeWidth;
    _paintPoint.color = pointColor;
    _paintPoint.style = PaintingStyle.fill;
    _paintPointCenter.color = pointInnerColor;
    _paintPointCenter.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final startOffset = Offset(0.0, size.height / 2);
    final endOffset = Offset(size.width, size.height / 2);
    canvas.drawLine(startOffset, endOffset, _paintBackground);
    final xStart = size.width * start;
    var cappedProgress = progress;
    if (progress > 1) {
      cappedProgress = 1.0;
    }
    var xProgress = size.width * cappedProgress;
    final progressStart = Offset(xStart, size.height / 2);
    canvas.drawLine(
        progressStart, Offset(xProgress, size.height / 2), _paintProgress);
    for (var point in points) {
      var pointPos = size.width * point;
      final pointX = Offset(pointPos, size.height / 2);
      canvas.drawCircle(pointX, pointRadius, _paintPoint);
      canvas.drawCircle(pointX, pointInnerRadius, _paintPointCenter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final old = oldDelegate as ProgressoPainter;
    return old.progress != this.progress ||
        old.start != this.start ||
        old.progressColor != this.progressColor ||
        old.backgroundColor != this.backgroundColor ||
        old.progressStrokeWidth != this.progressStrokeWidth ||
        old.backgroundStrokeWidth != this.backgroundStrokeWidth || 
        old.pointColor != this.pointColor ||
        old.pointInnerColor != this.pointInnerColor ||
        old.pointRadius != this.pointRadius ||
        old.pointInnerRadius != this.pointInnerRadius;
  }
}
