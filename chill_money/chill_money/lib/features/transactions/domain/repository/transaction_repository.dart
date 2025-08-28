import 'package:chill_money/features/transactions/domain/entity/transaction.dart';

abstract class TransactionRepository {
  Future<void> addTransact(Transact transaction);
  Future<List<Transact>> getTransact();
}
