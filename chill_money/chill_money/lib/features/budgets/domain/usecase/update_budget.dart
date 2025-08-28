import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';

class UpdateBudgetUsecase {
  final BudgetRepository budgetRepository;

  UpdateBudgetUsecase({required this.budgetRepository});

  Future<void> call(Budget budget) async {
    await budgetRepository.updateBudget(budget.id, budget);
  }
}
