import 'package:chill_money/features/transactions/domain/entity/stats.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';

abstract class TransactState {}

class InitialTransactState extends TransactState {}

class LoadingTransactState extends TransactState {}

class LoadedTransactState extends TransactState {
  final List<MapEntry<DateTime, List<Transact>>> transactionsByLastMounth;
  final List<MapEntry<DateTime, List<Transact>>> transactionsByCurrentMounth;
  final Stats stats;

  LoadedTransactState({
    required this.transactionsByLastMounth,
    required this.transactionsByCurrentMounth,
    required this.stats,
  });
}

class ErrorTransactState extends TransactState {
  final String error;

  ErrorTransactState({required this.error});
}
