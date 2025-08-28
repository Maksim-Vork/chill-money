import 'package:chill_money/features/dashboard/data/models/Savings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteDashboardSource {
  String? _getUserUuid() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw Exception('Пользователь не найден');
  }

  Future<SavingsModel> getAmount() async {
    try {
      final userId = _getUserUuid();
      final savingsStore = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('savings')
          .doc('current')
          .get();

      if (!savingsStore.exists) {
        return SavingsModel(amount: 0);
      }
      final SavingsModel savings = SavingsModel.fromMap(savingsStore.data()!);
      return savings;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateAmount(SavingsModel savings) async {
    try {
      final userId = _getUserUuid();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('savings')
          .doc('current')
          .set(
            savings.toMap(),
            SetOptions(merge: true),
          ); // Создаст документ если его нет
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
