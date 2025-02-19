class Transactions {
  final String name;
  final int sum;
  final bool transaction;
  Transactions(
      {required this.name, required this.sum, required this.transaction});
}

class TransactionsService {
  final List<Transactions> _transactionsList = [
    Transactions(name: 'Продукты', sum: 10, transaction: false),
    Transactions(name: 'Cпорт', sum: 10, transaction: false),
    Transactions(name: 'Здоровье', sum: 10, transaction: false),
    Transactions(name: 'Работа', sum: 10, transaction: true),
    Transactions(name: 'Перевод', sum: 10, transaction: true),
    Transactions(name: 'Продукты', sum: 10, transaction: false),
    Transactions(name: 'Развлечения', sum: 10, transaction: false),
  ];

  List<Transactions> get transactionsList => _transactionsList;
}
