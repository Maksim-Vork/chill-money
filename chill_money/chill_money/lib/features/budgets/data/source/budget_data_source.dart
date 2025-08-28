import 'package:chill_money/features/budgets/data/models/budget_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String _getCurrentUserId() {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('Пользователь не авторизован!');
  }
  return user.uid;
}

class RemoteBudgetDataSource {
  Future<void> add(BudgetModel budget) async {
    final userId = _getCurrentUserId();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('budgets')
          .doc(budget.id)
          .set(budget.toMap());
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<void> delete(String id) async {
    final userId = _getCurrentUserId();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('budgets')
          .doc(id)
          .delete();
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<List<BudgetModel>> getAll() async {
    final userId = _getCurrentUserId();
    try {
      final QuerySnapshot budgetsFireStore = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('budgets')
          .get();
      final List<BudgetModel> budgets = budgetsFireStore.docs
          .map(
            (budgetMap) => BudgetModel.fromMap(
              budgetMap.data() as Map<String, dynamic>,
              budgetMap.id,
            ),
          )
          .toList();
      return budgets;
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<void> update(String id, BudgetModel budget) async {
    final userId = _getCurrentUserId();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('budgets')
          .doc(id)
          .update(budget.toMap());
    } catch (e) {
      throw (Exception(e));
    }
  }
}
