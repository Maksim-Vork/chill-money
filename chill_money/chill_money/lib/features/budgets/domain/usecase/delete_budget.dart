import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';

class DeleteBudgetUsecase {
  final BudgetRepository budgetRepository;

  DeleteBudgetUsecase({required this.budgetRepository});

  Future<void> call(String id) async {
    await budgetRepository.deleteBudget(id);
  }
}
