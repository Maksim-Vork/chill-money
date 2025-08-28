import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Budget {
  final String id;
  final String name;
  final int totalAmount;
  final int spent;

  Budget({
    String? id,
    required this.name,
    required this.totalAmount,
    int? spent,
  }) : id = id ?? uuid.v4(),
       spent = spent ?? 0;

  get remainder => totalAmount - spent;
}
