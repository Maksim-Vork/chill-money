import 'dart:math';

import 'package:flutter/material.dart';

class CustomPainterSpend extends StatefulWidget {
  const CustomPainterSpend({super.key});

  @override
  State<CustomPainterSpend> createState() => _CustomPainterSpendState();
}

class _CustomPainterSpendState extends State<CustomPainterSpend> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: CustomPaint(
        painter: SpendPainter(),
      ),
    );
  }
}

class SpendPainter extends CustomPainter {
  final spend = 2300;
  final maxSpend = 7000;
  late final double procent;

  SpendPainter() {
    if (spend <= maxSpend) {
      procent = spend / maxSpend;
    } else {
      procent = 1.0;
    }
  }
  @override
  void paint(Canvas canvas, Size size) {
    final paintSpend = Paint()
      ..color = Color.fromARGB(255, 255, 111, 67)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 92, 92, 92)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    canvas.drawArc(Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
        pi / 2, pi * 2 * procent, false, paintSpend);
    canvas.drawArc(Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
        pi * 2 * procent + (pi / 2), pi * 2 * (1.0 - procent), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomPainterEerded extends StatefulWidget {
  const CustomPainterEerded({super.key});

  @override
  State<CustomPainterEerded> createState() => _CustomPainterEerdedState();
}

class _CustomPainterEerdedState extends State<CustomPainterEerded> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: CustomPaint(
        painter: EarnedPainter(),
      ),
    );
  }
}

class EarnedPainter extends CustomPainter {
  final earned = 3300;
  final maxEarned = 7000;
  late final double procent;

  EarnedPainter() {
    if (earned <= maxEarned) {
      procent = earned / maxEarned;
    } else {
      procent = 1.0;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paintSpend = Paint()
      ..color = Color.fromARGB(255, 67, 255, 111)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 92, 92, 92)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    canvas.drawArc(Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
        pi / 2, pi * 2 * procent, false, paintSpend);
    canvas.drawArc(Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
        pi * 2 * procent + (pi / 2), pi * 2 * (1.0 - procent), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
