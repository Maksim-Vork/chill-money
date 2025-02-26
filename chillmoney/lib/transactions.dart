class Transactions {
  final String name;
  final int sum;
  final bool transaction; // true = расход, false = доход
  final DateTime date;

  Transactions({
    required this.name,
    required this.sum,
    required this.transaction,
  }) : date = DateTime.now();
}

class TransactionsService {
  int _allSavings = 0;
  final List<Transactions> _transactionsList = [];

  int _icomeCurrentMonth = 0;
  int _spendingCurrentMonth = 0;

  int icomeLastMonth = 0;
  int spendingLastMonth = 0;

  int get icomeCurrentMonth => _icomeCurrentMonth;
  int get spendingCurrentMonth => _spendingCurrentMonth;

  final Map<DateTime, List<Transactions>> _currentMonth = {};
  final Map<DateTime, List<Transactions>> _lastMonth = {};

  int get allsavings => _allSavings;

  List<Transactions> get transactionsListReversed =>
      _transactionsList.reversed.toList();

  List<Transactions> get transactionsList => _transactionsList;

  void addTransaction(String name, int sum, bool transaction) {
    final newTransaction =
        Transactions(name: name, sum: sum, transaction: transaction);
    _transactionsList.add(newTransaction);

    if (transaction) {
      _allSavings -= sum;
    } else {
      _allSavings += sum;
    }

    final month = DateTime.now().month;
    final transactionMonth = newTransaction.date.month;

    if (transactionMonth == month) {
      _addToMap(_currentMonth, newTransaction);
    } else if (transactionMonth == month - 1) {
      _addToMap(_lastMonth, newTransaction);
    }

    if (transaction == false) {
      _icomeCurrentMonth += sum;
    } else {
      _spendingCurrentMonth += sum;
    }
  }

  void _addToMap(
      Map<DateTime, List<Transactions>> map, Transactions transaction) {
    DateTime dateKey = DateTime(
        transaction.date.year, transaction.date.month, transaction.date.day);
    if (!map.containsKey(dateKey)) {
      map[dateKey] = [];
    }
    map[dateKey]!.add(transaction);
  }

  Map<DateTime, List<Transactions>> get groupedCurrentMonth => _currentMonth;
  Map<DateTime, List<Transactions>> get groupedLastMonth => _lastMonth;
}
