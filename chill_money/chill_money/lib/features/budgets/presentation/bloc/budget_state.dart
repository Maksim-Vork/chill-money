import 'package:chill_money/features/budgets/domain/entity/budget.dart';

abstract class BudgetState {}

class InitialBudget extends BudgetState {}

class LoadingBudget extends BudgetState {}

class LoadedBudget extends BudgetState {
  final List<Budget> budgets;

  LoadedBudget({required this.budgets});
}

class ErorBudget extends BudgetState {
  final String error;

  ErorBudget({required this.error});
}
