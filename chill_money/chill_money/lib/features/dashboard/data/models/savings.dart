class SavingsModel {
  final int amount;

  SavingsModel({required this.amount});

  factory SavingsModel.fromMap(Map<String, dynamic> map) {
    return SavingsModel(amount: map['amount'] ?? 0);
  }

  Map<String, dynamic> toMap() {
    return {'amount': amount};
  }
}
