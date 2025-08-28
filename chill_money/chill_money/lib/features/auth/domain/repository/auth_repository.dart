abstract class AuthRepository {
  Future<bool> checkAuthUser();
  Future<void> signOut();
  Future<void> register(String email, String password);
  Future<void> loginWithEmail(String email, String password);
  Future<void> loginWithGoogle();
}
