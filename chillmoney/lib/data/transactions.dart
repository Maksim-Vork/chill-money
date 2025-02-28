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
  int allSavingsLast = 0;

  final Map<DateTime, List<Transactions>> _currentMonth = {};
  final Map<DateTime, List<Transactions>> _lastMonth = {};

  Map<DateTime, List<Transactions>> get currentMonth => _currentMonth;

  List<MapEntry<DateTime, List<Transactions>>> _currentMonthList = [];

  TransactionsService() {
    _currentMonthList = _currentMonth.entries.toList();
  }
  // Метод подсчета общей суммы накоплений
  void _controllSum(bool transaction, int sum) {
    if (transaction) {
      _allSavings -= sum;
    } else {
      _allSavings += sum;
    }
  }

// Метод добавления транзакции в мап по дням
  void _addToMap(
      Map<DateTime, List<Transactions>> map, Transactions transaction) {
    DateTime dateKey = DateTime(
        transaction.date.year, transaction.date.month, transaction.date.day);
    if (!map.containsKey(dateKey)) {
      map[dateKey] = [];
    }
    map[dateKey]!.add(transaction);
  }

// Метод распределения транзакций по месяцам
  void _controllTransactionMonth(Transactions newTransaction) {
    final month = DateTime.now().month;
    final transactionMonth = newTransaction.date.month;

    if (transactionMonth == month) {
      _addToMap(_currentMonth, newTransaction);
      _currentMonthList = _currentMonth.entries.toList();
    } else if (transactionMonth == month - 1) {
      _addToMap(_lastMonth, newTransaction);
    }
  }

  // Метод подсчета суммы заработка/траты за месяц
  void _totalSumController(bool transaction, int sum) {
    if (transaction == false) {
      _icomeCurrentMonth += sum;
    } else {
      _spendingCurrentMonth += sum;
    }
  }

  // Метод добавления транзакций
  void addTransaction(String name, int sum, bool transaction) {
    final newTransaction =
        Transactions(name: name, sum: sum, transaction: transaction);
    _transactionsList.add(newTransaction);

    _controllSum(transaction, sum);

    _controllTransactionMonth(newTransaction);

    _totalSumController(transaction, sum);
  }

  List<MapEntry<DateTime, List<Transactions>>> get currentMonthList =>
      _currentMonthList;
  int get allSavings => _allSavings;

  List<Transactions> get transactionsListReversed =>
      _transactionsList.reversed.toList();

  List<Transactions> get transactionsList => _transactionsList;

  int get icomeCurrentMonth => _icomeCurrentMonth;
  int get spendingCurrentMonth => _spendingCurrentMonth;
}
