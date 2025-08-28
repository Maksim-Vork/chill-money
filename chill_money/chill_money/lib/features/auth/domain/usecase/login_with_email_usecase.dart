import 'package:chill_money/features/auth/domain/repository/auth_repository.dart';

class LoginWithEmailUsecase {
  final AuthRepository authRepository;

  LoginWithEmailUsecase({required this.authRepository});

  Future<void> call(String email, String password) async {
    await authRepository.loginWithEmail(email, password);
  }
}
