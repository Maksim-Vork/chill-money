import 'package:chill_money/features/auth/data/datasource/auth_datasource.dart';
import 'package:chill_money/features/auth/domain/repository/auth_repository.dart';

class AuthReposiryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthReposiryImpl({required this.authDatasource});
  @override
  Future<bool> checkAuthUser() async {
    return await authDatasource.check();
  }

  @override
  Future<void> loginWithEmail(String email, String password) async {
    await authDatasource.loginWithEmail(email, password);
  }

  @override
  Future<void> register(String email, String password) async {
    await authDatasource.register(email, password);
  }

  @override
  Future<void> signOut() async {
    await authDatasource.signOut();
  }

  @override
  Future<void> loginWithGoogle() async {
    await authDatasource.loginWithGoogle();
  }
}
