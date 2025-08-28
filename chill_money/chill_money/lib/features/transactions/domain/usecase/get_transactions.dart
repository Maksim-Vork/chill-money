import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/domain/repository/transaction_repository.dart';

class GetTransactions {
  final TransactionRepository transactionRepository;

  GetTransactions({required this.transactionRepository});

  Future<List<Transact>> call() async {
    return await transactionRepository.getTransact();
  }

  //переписать под получение списка мапов типо дней и в каждом дне список транзакций
}
