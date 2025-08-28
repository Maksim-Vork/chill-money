import 'dart:math';

import 'package:chill_money/data/transactions.dart';
import 'package:flutter/material.dart';

class CustomPainterSpend extends StatefulWidget {
  final TransactionsService transactionsService;
  const CustomPainterSpend({super.key, required this.transactionsService});

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
        painter: SpendPainter(
          spend: widget.transactionsService.spendingCurrentMonth,
        ),
      ),
    );
  }
}

class SpendPainter extends CustomPainter {
  final int spend;
  final int maxSpend = 5000;
  late final double procent;

  SpendPainter({required this.spend}) {
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

    canvas.drawArc(
      Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
      pi / 2,
      pi * 2 * procent,
      false,
      paintSpend,
    );
    canvas.drawArc(
      Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
      pi * 2 * procent + (pi / 2),
      pi * 2 * (1.0 - procent),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomPainterEerded extends StatefulWidget {
  final TransactionsService transactionsService;
  const CustomPainterEerded({super.key, required this.transactionsService});

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
        painter: EarnedPainter(
          earned: widget.transactionsService.icomeCurrentMonth,
        ),
      ),
    );
  }
}

class EarnedPainter extends CustomPainter {
  final int earned;
  final int maxEarned = 5000;
  late final double procent;

  EarnedPainter({required this.earned}) {
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

    canvas.drawArc(
      Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
      pi / 2,
      pi * 2 * procent,
      false,
      paintSpend,
    );
    canvas.drawArc(
      Offset(3.5, 3.5) & Size(size.width - 7, size.height - 7),
      pi * 2 * procent + (pi / 2),
      pi * 2 * (1.0 - procent),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
