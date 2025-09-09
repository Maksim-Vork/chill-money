import 'package:chill_money/features/transactions/domain/entity/transact_sort_by_month.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/domain/repository/transaction_repository.dart';

class GetTransactSortByMounth {
  final TransactionRepository transactionRepository;

  GetTransactSortByMounth({required this.transactionRepository});

  Future<TransactSortByMonth> call() async {
    final List<Transact> transactions = await transactionRepository
        .getTransact();
    final Map<DateTime, List<Transact>> mapTransactions = {};

    for (var transact in transactions) {
      final DateTime formatDate = DateTime(
        transact.date.year,
        transact.date.month,
        transact.date.day,
      );
      mapTransactions.putIfAbsent(formatDate, () => []);

      mapTransactions[formatDate]!.add(transact);
    }

    final List<MapEntry<DateTime, List<Transact>>> transactionSortByDay =
        mapTransactions.entries.toList();
    final List<MapEntry<DateTime, List<Transact>>> transactSortByCurrentMonth =
        [];
    final List<MapEntry<DateTime, List<Transact>>> transactSortByLastMonth = [];
    final DateTime currentDate = DateTime.now();
    for (var transact in transactionSortByDay) {
      if (transact.key.month == currentDate.month) {
        transactSortByCurrentMonth.add(transact);
      } else if (transact.key.month == currentDate.month - 1) {
        transactSortByLastMonth.add(transact);
      }
    }
    transactSortByCurrentMonth.sort((a, b) => b.key.compareTo(a.key));
    transactSortByLastMonth.sort((a, b) => b.key.compareTo(a.key));
    return TransactSortByMonth(
      transactSortByCurrentMonth: transactSortByCurrentMonth,

      transactSortByLastMonth: transactSortByLastMonth,
    );
  }
}
