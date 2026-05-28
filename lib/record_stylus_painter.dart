import 'dart:math';

import 'package:flutter/material.dart';

class ToneArmBearingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width, :height) = size;
    final centre = Offset(width * 3 / 8, height * 1 / 8);
    final radius = min(width, height / 2);

    final toneArmBearingStroke = Paint()
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        begin: AlignmentGeometry.centerLeft,
        end: AlignmentGeometry.bottomCenter,

        colors: [
          const Color.fromARGB(255, 19, 19, 19),
          Colors.white,
          const Color.fromARGB(255, 19, 19, 19),
        ],
      ).createShader(Rect.fromCircle(center: centre, radius: radius));
    canvas.drawCircle(centre, radius, toneArmBearingStroke);
    final toneArmBearingFill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 36, 36, 36);

    canvas.drawCircle(centre, radius, toneArmBearingFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ToneArmPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;

    final toneArmPainterStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width * 0.14
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        transform: GradientRotation(0),
        colors: [
          Color.fromARGB(255, 187, 186, 186),
          Color.fromARGB(255, 19, 19, 19),
        ],
        stops: [0.0, 0.8],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    final path = Path()
      ..moveTo(width / 2, 0)
      ..lineTo(width * 3.9 / 8, height * 0.7)
      ..lineTo(width * 1.5 / 8, height);

    canvas.drawPath(path, toneArmPainterStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CounterWeightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width, :height) = size;

    final counterWeightStroke = Paint()
      ..style = PaintingStyle.stroke
      ..shader =
          LinearGradient(
            begin: AlignmentGeometry.topLeft,

            colors: [
              const Color.fromARGB(255, 19, 19, 19),
              Colors.white,
              const Color.fromARGB(255, 19, 19, 19),
            ],
          ).createShader(
            Rect.fromLTWH(width * 3 / 8, height * 7 / 8, width, height),
          );
    canvas.drawRect(
      Rect.fromLTWH(width * 3 / 8, height * 7 / 8, width, height),
      counterWeightStroke,
    );
    final counterWeightFill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 36, 36, 36);

    canvas.drawRect(
      Rect.fromLTWH(width * 3 / 8, height * 7 / 8, width, height),
      counterWeightFill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CounterWeightNeedlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width, :height) = size;

    final counterWeightNeedleStroke = Paint()
      ..style = PaintingStyle.stroke
      ..shader =
          LinearGradient(
            begin: AlignmentGeometry.topLeft,

            colors: [
              const Color.fromARGB(255, 113, 113, 113),

              const Color.fromARGB(255, 157, 154, 154),
            ],
          ).createShader(
            Rect.fromLTWH(width * 3 / 8, height * 7 / 8, width, height),
          );
    canvas.drawRect(
      Rect.fromLTWH(width * 3 / 8, height * 7 / 8, width, height),
      counterWeightNeedleStroke,
    );
    final counterWeightNeedleFill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 88, 87, 87);

    canvas.drawRect(
      Rect.fromLTWH(width * 3 / 8, height * 7 / 8, width, height),
      counterWeightNeedleFill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
