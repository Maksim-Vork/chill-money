import 'package:chill_money/features/budgets/domain/entity/budget.dart';

abstract class BudgetEvent {}

class CreateBudgetEvent extends BudgetEvent {
  final Budget budget;

  CreateBudgetEvent({required this.budget});
}

class DeleteBudgetEvent extends BudgetEvent {
  final String id;

  DeleteBudgetEvent({required this.id});
}

class UpdateBudgetEvent extends BudgetEvent {
  final Budget budget;

  UpdateBudgetEvent({required this.budget});
}

class ResetBudgetEvent extends BudgetEvent {}

class GetAllBudgetEvent extends BudgetEvent {}
