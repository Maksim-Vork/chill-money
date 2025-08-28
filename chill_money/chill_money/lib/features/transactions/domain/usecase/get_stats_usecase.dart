import 'package:chill_money/features/transactions/domain/entity/stats.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/domain/repository/transaction_repository.dart';

class GetStatsUsecase {
  final TransactionRepository transactionRepository;

  GetStatsUsecase({required this.transactionRepository});

  Future<Stats> call() async {
    double currentExpens = 0;
    double currentIcome = 0;

    double pastExpens = 0;
    double pastIcome = 0;

    final int currentMonth = DateTime.now().month;
    final int previousMonth = currentMonth - 1;

    final List<Transact> transactions = await transactionRepository
        .getTransact();

    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].date.month == currentMonth) {
        if (transactions[i].isSpend) {
          currentExpens += transactions[i].sum;
        } else {
          currentIcome += transactions[i].sum;
        }
      } else if (transactions[i].date.month == previousMonth) {
        if (transactions[i].isSpend) {
          pastExpens += transactions[i].sum;
        } else {
          pastIcome += transactions[i].sum;
        }
      }
    }

    return Stats(
      currentExpens: currentExpens,
      currentIcome: currentIcome,
      pastExpens: pastExpens,
      pastIcome: pastIcome,
    );
  }
}
