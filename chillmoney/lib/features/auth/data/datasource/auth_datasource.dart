import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasource {
  Future<bool> check() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw (Exception(e));
    }
  }
}
