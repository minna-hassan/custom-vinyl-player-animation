import 'package:custom_painter_assignment/record_stylus_painter.dart';
import 'package:flutter/material.dart';

class RecordStylus extends StatelessWidget {
  final double boardWidth;
  final double boardHeight;

  const RecordStylus({
    super.key,
    required this.boardWidth,
    required this.boardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boardWidth,
      height: boardHeight,
      child: Stack(
        children: [
          Positioned(
            left: boardWidth * 0.679,
            top: boardWidth * 0.11335,
            child: Container(
              height: boardWidth * 0.07,
              width: boardWidth * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: boardWidth * 0.026,
                    offset: Offset(boardWidth * -0.001, boardWidth * 0.001),
                    spreadRadius: boardWidth * 0.0001,
                  ),
                ],
              ),
              child: CustomPaint(painter: ToneArmBearingPainter()),
            ),
          ),
          Positioned(
            left: boardWidth * 0.65,
            top: boardWidth * 0.105,
            child: Container(
              height: boardWidth * 0.39,
              width: boardWidth * 0.1,
              transform: Matrix4.rotationZ(0.235398),
              child: CustomPaint(painter: ToneArmPainter()),
            ),
          ),
          Positioned(
            left: boardWidth * 0.615,
            top: boardWidth * 0.41,
            child: Container(
              height: boardWidth * 0.07,
              width: boardWidth * 0.047,
              transform: Matrix4.rotationZ(0.955398),
              child: CustomPaint(painter: CounterWeightPainter()),
            ),
          ),
          Positioned(
            left: boardWidth * 0.5175,
            top: boardWidth * 0.5175,
            child: Container(
              height: boardWidth * 0.010,
              width: boardWidth * 0.002,
              transform: Matrix4.rotationZ(0.955398),
              child: CustomPaint(painter: CounterWeightNeedlePainter()),
            ),
          ),
          Positioned(
            left: boardWidth * 0.533,
            top: boardWidth * 0.48595,
            child: Container(
              height: boardWidth * 0.019,
              width: boardWidth * 0.025,
              transform: Matrix4.rotationZ(0.955398),
              child: CustomPaint(painter: CounterWeightPainter()),
            ),
          ),
          Positioned(
            left: boardWidth * 0.685,
            top: boardWidth * 0.114,
            child: Container(
              height: boardWidth * 0.04,
              width: boardWidth * 0.04,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: boardWidth * 0.007,
                    offset: Offset(boardWidth * -0.001, boardWidth * -0.001),
                    spreadRadius: boardWidth * 0.0001,
                  ),
                ],
              ),
              child: CustomPaint(painter: ToneArmBearingPainter()),
            ),
          ),
        ],
      ),
    );
  }
}
