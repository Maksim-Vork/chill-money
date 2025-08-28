import 'package:chill_money/features/transactions/domain/entity/stats.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';

abstract class TransactState {}

class InitialTransactState extends TransactState {}

class LoadingTransactState extends TransactState {}

class LoadedTransactState extends TransactState {
  final List<Transact> transactions;
  final Stats stats;

  LoadedTransactState({required this.transactions, required this.stats});
}

class ErrorTransactState extends TransactState {
  final String error;

  ErrorTransactState({required this.error});
}
