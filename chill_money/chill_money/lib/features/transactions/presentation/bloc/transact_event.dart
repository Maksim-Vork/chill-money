import 'package:chill_money/features/transactions/domain/entity/transaction.dart';

abstract class TransactEvent {}

class AddTransactionEvent extends TransactEvent {
  final Transact transact;

  AddTransactionEvent({required this.transact});
}

class GetTransactionsEvent extends TransactEvent {}

class ResetTransactionsEvent extends TransactEvent {}
