class Transactions {
  final String name;
  final int sum;
  final bool transaction;
  final DateTime data;

  Transactions({
    required this.name,
    required this.sum,
    required this.transaction,
  }) : data = DateTime.now();
}

class TransactionsService {
  DateTime currentDate = DateTime.now();
  int _allSavings = 0;

  int get allsavings => _allSavings;

  void plus(int number) {
    _allSavings += number;
  }

  void minus(int number) {
    _allSavings -= number;
  }

  final List<Transactions> _transactionsList = [];
  List<Transactions> get transactionsListReversed =>
      _transactionsList.reversed.toList();

  List<Transactions> get transactionsList => _transactionsList;
  final List<Transactions> _currentMonth = [];
  final List<Transactions> _lastMonth = [];
  void sortMoth(List<Transactions> list) {
    for (int i = 0; i < _transactionsList.length; i++) {
      if (_transactionsList[i].data.month == currentDate.month) {
        _currentMonth.add(_transactionsList[i]);
      } else if (_transactionsList[i].data.month == currentDate.month - 1) {
        _lastMonth.add(_transactionsList[i]);
      }
    }
  }

  Map<DateTime, List<Transactions>> groupTransactionsByDay(
      List<Transactions> transactions) {
    Map<DateTime, List<Transactions>> groupedTransactions = {};

    for (var transaction in transactions) {
      DateTime date = DateTime(
          transaction.data.year, transaction.data.month, transaction.data.day);

      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }

    return groupedTransactions;
  }

  void addTransactions(String name, int sum, bool transaction) {
    _transactionsList
        .add(Transactions(name: name, sum: sum, transaction: transaction));
    if (transaction == false) {
      plus(sum);
    } else {
      minus(sum);
    }
  }
}
