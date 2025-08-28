import 'package:cloud_firestore/cloud_firestore.dart';

class TransactModel {
  final String name;
  final bool isSpend;
  final int sum;
  final DateTime date;

  TransactModel({
    required this.name,
    required this.isSpend,
    required this.sum,
    required this.date,
  });

  factory TransactModel.fromMap(Map<String, dynamic> map) {
    return TransactModel(
      name: map['name'] as String,
      isSpend: map['isSpend'] as bool,
      sum: map['sum'] as int,
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSpend': isSpend,
      'sum': sum,
      'date': Timestamp.fromDate(date),
    };
  }
}
