import 'package:chill_money/features/budgets/data/models/budget_model.dart';
import 'package:chill_money/features/budgets/data/source/budget_data_source.dart';
import 'package:chill_money/features/budgets/domain/entity/budget.dart';
import 'package:chill_money/features/budgets/domain/repository/budget_repository.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final RemoteBudgetDataSource budgetDataSource;

  BudgetRepositoryImpl({required this.budgetDataSource});
  @override
  Future<void> addBudget(Budget budget) async {
    final BudgetModel budgetModel = BudgetModel(
      name: budget.name,
      totalAmount: budget.totalAmount,
      spent: budget.spent,
    );
    await budgetDataSource.add(budgetModel);
  }

  @override
  Future<void> deleteBudget(String id) async {
    await budgetDataSource.delete(id);
  }

  @override
  Future<List<Budget>> getAllBudgets() async {
    final List<BudgetModel> budgetsModel = await budgetDataSource.getAll();
    final List<Budget> budgets = budgetsModel
        .map(
          (budgetModel) => Budget(
            id: budgetModel.id,
            name: budgetModel.name,
            totalAmount: budgetModel.totalAmount,
            spent: budgetModel.spent,
          ),
        )
        .toList();
    return budgets;
  }

  @override
  Future<void> updateBudget(String id, Budget budget) async {
    final BudgetModel budgetModel = BudgetModel(
      name: budget.name,
      totalAmount: budget.totalAmount,
      spent: budget.spent,
    );
    await budgetDataSource.update(id, budgetModel);
  }
}
