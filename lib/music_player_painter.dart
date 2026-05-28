import 'dart:math';

import 'package:flutter/material.dart';

class RecordDiskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;
    final centre = Offset(width / 2, height / 2);
    final radius = min(width, height) / 2;

    final gradientThinRings =
        LinearGradient(
          colors: [
            const Color.fromARGB(147, 60, 60, 60),
            const Color.fromARGB(145, 60, 60, 60),
            const Color.fromARGB(132, 158, 157, 157),
            const Color.fromARGB(176, 60, 60, 60),
            const Color.fromARGB(139, 60, 60, 60),
          ],
          begin: AlignmentGeometry.centerLeft,
          end: Alignment.bottomCenter,
          transform: GradientRotation(500),
        ).createShader(
          Rect.fromCenter(center: centre, width: width, height: height),
        );
    final gradientInnerDarkRings =
        LinearGradient(
          colors: [
            const Color.fromARGB(121, 38, 38, 38),
            const Color.fromARGB(176, 38, 38, 38),
            const Color.fromARGB(118, 140, 140, 140),
            const Color.fromARGB(176, 38, 38, 30),
            const Color.fromARGB(146, 29, 28, 28),
          ],
          begin: AlignmentGeometry.centerLeft,
          end: Alignment.bottomCenter,
          transform: GradientRotation(500),
        ).createShader(
          Rect.fromCenter(center: centre, width: width, height: height),
        );

    final recordDiskEdgesPainter = Paint()
      ..color = const Color.fromARGB(255, 168, 168, 168)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.016;
    final recordlabelEdges = Paint()
      ..color = const Color.fromARGB(255, 168, 168, 168)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.005;
    canvas.drawCircle(centre, radius, recordDiskEdgesPainter);

    final recordAfterEdgeRing = Paint()
      ..color = const Color.fromARGB(255, 45, 30, 30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.005;
    canvas.drawCircle(centre, radius - radius * 0.005, recordAfterEdgeRing);

    final recordDiskFillPainter = Paint()
      ..color = const Color.fromARGB(255, 23, 23, 23)
      ..style = PaintingStyle.fill;
    final centerHoleHighLight = Paint()
      ..color = const Color.fromARGB(158, 255, 255, 255)
      ..style = PaintingStyle.fill;
    final centerHoleFill = Paint()
      ..color = const Color.fromARGB(255, 37, 37, 37)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(centre, radius, recordAfterEdgeRing);
    canvas.drawCircle(centre, radius, recordDiskFillPainter);

    final diskline1Painter = Paint()
      ..color = const Color.fromARGB(255, 60, 60, 60)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.016;
    final diskline2Painter = Paint()
      ..color = const Color.fromARGB(255, 17, 18, 16)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.042;
    final diskline3Painter = Paint()
      ..color = const Color.fromARGB(255, 60, 60, 60)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.036;

    final thinGrooveLinePainter1 = Paint()
      ..shader = gradientThinRings
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.005;
    final thinGrooveLinePainter2 = Paint()
      ..shader = gradientThinRings
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.005;
    final thickGrooveLinePainter = Paint()
      ..shader = gradientInnerDarkRings
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.005;
    final labelDiskAfterEdgeRing = Paint()
      ..color = const Color.fromARGB(255, 15, 15, 15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.052;
    final diskline1MidPainter = Paint()
      ..color = const Color.fromARGB(255, 24, 24, 24)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.068;

    canvas.drawCircle(centre, radius * 0.969, diskline1Painter);
    canvas.drawCircle(centre, radius * 0.964, diskline3Painter);
    canvas.drawCircle(centre, radius * 0.932, diskline2Painter);
    canvas.drawCircle(centre, radius * 0.506, diskline1MidPainter);
    canvas.drawCircle(centre, radius * 0.470, centerHoleFill);
    canvas.drawCircle(centre, radius * 0.490, labelDiskAfterEdgeRing);

    for (double i = 0.104; i <= 0.468; i += 0.036) {
      canvas.drawCircle(centre, radius * (1 - i), thinGrooveLinePainter1);
    }
    for (double i = 0.125; i <= 0.468; i += 0.036) {
      canvas.drawCircle(centre, radius * (1 - i), thinGrooveLinePainter2);
    }
    for (double i = 0.145; i <= 0.468; i += 0.036) {
      canvas.drawCircle(centre, radius * (1 - i), thickGrooveLinePainter);
    }

    canvas.drawCircle(centre, radius * 0.480, recordlabelEdges);

    canvas.drawCircle(
      Offset(width / 2, 4.5 * height / 8),
      radius * 0.065,
      recordDiskFillPainter,
    );

    canvas.drawCircle(
      Offset(3.9 * width / 8, 4.4 * height / 8),
      radius * 0.013,
      centerHoleHighLight,
    );

    TextSpan span = TextSpan(
      text: "SAINT LAURENT",
      style: TextStyle(
        fontSize: radius * 0.068,
        color: Colors.white,
        letterSpacing: radius * 0.005,
      ),
    );
    TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(width / 2 - radius * 0.3, height * 3.4 / 8 - radius * 0.2),
    );

    TextSpan span1 = TextSpan(
      text: "WOMEN'S SUMMER 21",
      style: TextStyle(
        fontSize: radius * 0.047,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        letterSpacing: radius * 0.005,
      ),
    );
    TextPainter textPainter1 = TextPainter(
      text: span1,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter1.layout();
    textPainter1.paint(
      canvas,
      Offset(width / 2 - radius * 0.3, height * 3.4 / 8 - radius * 0.10),
    );

    TextSpan span2 = TextSpan(
      text: "SOUND TRACK",
      style: TextStyle(
        fontSize: radius * 0.047,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        letterSpacing: radius * 0.005,
      ),
    );
    TextPainter textPainter2 = TextPainter(
      text: span2,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter2.layout();
    textPainter2.paint(
      canvas,
      Offset(width / 2 - radius * 0.3, height * 3.4 / 8 - radius * 0.03),
    );

    TextSpan span3 = TextSpan(
      text: "BY SEBASTIAN",
      style: TextStyle(
        fontSize: radius * 0.047,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        letterSpacing: radius * 0.005,
      ),
    );
    TextPainter textPainter3 = TextPainter(
      text: span3,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter3.layout();
    textPainter3.paint(
      canvas,
      Offset(width / 2 - radius * 0.3, height * 4 / 8 - radius * 0.11),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
