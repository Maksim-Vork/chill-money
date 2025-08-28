import 'package:chill_money/features/transactions/data/models/transact_model.dart';
import 'package:chill_money/features/transactions/data/source/remote_transaction_datasource.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final RemoteTransactionDatasource remoteTransactionDataSource;

  TransactionRepositoryImpl({required this.remoteTransactionDataSource});

  @override
  Future<void> addTransact(Transact transaction) async {
    final TransactModel transactModel = TransactModel(
      name: transaction.name,
      isSpend: transaction.isSpend,
      sum: transaction.sum,
      date: transaction.date,
    );
    await remoteTransactionDataSource.addTransact(transactModel);
  }

  @override
  Future<List<Transact>> getTransact() async {
    final List<TransactModel> transactionsModel =
        await remoteTransactionDataSource.getTransact();
    final List<Transact> transactions = transactionsModel
        .map(
          (e) => Transact(
            name: e.name,
            isSpend: e.isSpend,
            sum: e.sum,
            date: e.date,
          ),
        )
        .toList();

    return transactions;
  }
}
