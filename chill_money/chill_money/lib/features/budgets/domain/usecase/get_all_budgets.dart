import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';

class GetAllBudgetsUsecase {
  final BudgetRepository budgetRepository;

  GetAllBudgetsUsecase({required this.budgetRepository});

  Future<List<Budget>> call() async {
    return await budgetRepository.getAllBudgets();
  }
}
