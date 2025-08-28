import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';

class AddBudgetUsecase {
  final BudgetRepository budgetRepository;

  AddBudgetUsecase({required this.budgetRepository});

  Future<void> call(Budget budget) async {
    await budgetRepository.addBudget(budget);
  }
}
