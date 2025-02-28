import 'dart:math';

import 'package:chillmoney/data/transactions.dart';
import 'package:flutter/material.dart';

class CustomPainterSpendLast extends StatefulWidget {
  final TransactionsService transactionsService;
  const CustomPainterSpendLast({super.key, required this.transactionsService});

  @override
  State<CustomPainterSpendLast> createState() => _CustomPainterSpendLastState();
}

class _CustomPainterSpendLastState extends State<CustomPainterSpendLast> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: CustomPaint(
        painter:
            SpendPainter(spend: widget.transactionsService.spendingLastMonth),
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

class CustomPainterEerdedLast extends StatefulWidget {
  final TransactionsService transactionsService;
  const CustomPainterEerdedLast({super.key, required this.transactionsService});

  @override
  State<CustomPainterEerdedLast> createState() =>
      _CustomPainterEerdedLastState();
}

class _CustomPainterEerdedLastState extends State<CustomPainterEerdedLast> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: CustomPaint(
        painter:
            EarnedPainter(earned: widget.transactionsService.icomeLastMonth),
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
