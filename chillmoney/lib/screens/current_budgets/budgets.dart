class Budgets {
  final String name;
  final int totalAmount;

  int _spent = 0;
  Budgets({
    required this.name,
    required this.totalAmount,
  });

  int get remainder => totalAmount - _spent;
  int get spent => _spent;

  void spend(int amount) {
    if (amount > 0 && amount <= remainder) {
      _spent += amount;
    } else {
      throw Exception("Не достаточно средств");
    }
  }
}

class BudgetsService {
  final List<Budgets> _budgetsList = [
    Budgets(name: 'Развлечения', totalAmount: 1000),
    Budgets(name: 'Продукты', totalAmount: 500),
  ];

  List<Budgets> get budgetsList => _budgetsList;

  void addBudget(int totalAmount, String name) {
    _budgetsList.add(Budgets(name: name, totalAmount: totalAmount));
  }

  void deleteBudget(int index) {
    _budgetsList.remove(index);
  }
}
