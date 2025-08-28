import 'package:chill_money/features/budgets/domain/entity/budget.dart';

abstract class BudgetRepository {
  Future<void> addBudget(Budget budget);
  Future<void> deleteBudget(String id);
  Future<List<Budget>> getAllBudgets();
  Future<void> updateBudget(String id, Budget budget);
}
