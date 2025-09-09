import 'package:chill_money/features/transactions/domain/entity/transaction.dart';

class TransactSortByMonth {
  final List<MapEntry<DateTime, List<Transact>>> transactSortByCurrentMonth;
  final List<MapEntry<DateTime, List<Transact>>> transactSortByLastMonth;

  TransactSortByMonth({
    required this.transactSortByCurrentMonth,
    required this.transactSortByLastMonth,
  });
}
