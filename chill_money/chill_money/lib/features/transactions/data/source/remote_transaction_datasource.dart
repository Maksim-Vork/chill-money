import 'package:chill_money/features/transactions/data/models/transact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteTransactionDatasource {
  String _getUserUuid() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw Exception('Пользователь не найден');
  }

  Future<void> addTransact(TransactModel transactModel) async {
    try {
      final String userId = _getUserUuid();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('transactons')
          .doc()
          .set(transactModel.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TransactModel>> getTransact() async {
    try {
      final String userId = _getUserUuid();
      final QuerySnapshot transactionsFire = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('transactons')
          .get();
      final List<TransactModel> transactions = transactionsFire.docs
          .map((e) => TransactModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      return transactions;
    } catch (e) {
      throw Exception(e);
    }
  }
}
