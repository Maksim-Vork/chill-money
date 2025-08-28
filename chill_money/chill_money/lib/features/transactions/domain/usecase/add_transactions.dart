import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';
import 'package:chill_money/features/dashboard/domain/entity/savings.dart';
import 'package:chill_money/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:chill_money/features/transactions/domain/entity/transaction.dart';
import 'package:chill_money/features/transactions/domain/repository/transaction_repository.dart';

class AddTransactions {
  final TransactionRepository transactionRepository;
  final BudgetRepository budgetRepository;
  final DashboardRepository dashboardRepository;

  AddTransactions(
    this.budgetRepository,
    this.dashboardRepository, {
    required this.transactionRepository,
  });

  Future<void> call(Transact transaction) async {
    await transactionRepository.addTransact(transaction);

    final int sum = transaction.sum;
    final savings = await dashboardRepository.getCurrentAmount();
    final int currentAmount = savings.amount;

    if (transaction.isSpend) {
      dashboardRepository.updateCurrentAmount(
        Savings(amount: currentAmount - sum),
      );

      final List<Budget> budgets = await budgetRepository.getAllBudgets();
      final Budget? budgetByName = budgets.firstWhere(
        (e) => e.name == transaction.name,
      );

      if (budgetByName != null) {
        final int currentBalance = budgetByName.remainder - sum;
        if (currentBalance > 0) {
          budgetRepository.updateBudget(
            budgetByName.id,
            Budget(
              name: budgetByName.name,
              totalAmount: budgetByName.totalAmount,
              spent: budgetByName.spent + sum,
            ),
          );
        } else {
          budgetRepository.updateBudget(
            budgetByName.id,
            Budget(
              name: budgetByName.name,
              totalAmount: budgetByName.totalAmount,
              spent: budgetByName.totalAmount,
            ),
          );
        }
      }
    } else {
      dashboardRepository.updateCurrentAmount(
        Savings(amount: currentAmount + sum),
      );
    }
  }
}
