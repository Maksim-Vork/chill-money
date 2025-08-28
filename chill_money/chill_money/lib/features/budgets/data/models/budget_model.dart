import 'package:uuid/uuid.dart';

var uuid = Uuid();

class BudgetModel {
  final String? id;
  final String name;
  final int totalAmount;
  final int spent;

  BudgetModel({
    String? id,
    required this.name,
    required this.totalAmount,
    int? spent,
  }) : id = id ?? uuid.v4(),
       spent = spent ?? 0;

  Map<String, dynamic> toMap() {
    return {'name': name, 'totalAmount': totalAmount, 'spent': spent};
  }

  factory BudgetModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BudgetModel(
      id: documentId,
      name: map['name'],
      totalAmount: map['totalAmount'],
      spent: map['spent'],
    );
  }
}
