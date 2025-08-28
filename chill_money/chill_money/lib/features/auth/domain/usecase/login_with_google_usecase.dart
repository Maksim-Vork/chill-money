import 'package:chill_money/features/auth/domain/repository/auth_repository.dart';

class LoginWithGoogleUsecase {
  final AuthRepository authRepository;

  LoginWithGoogleUsecase({required this.authRepository});

  Future<void> call() async {
    await authRepository.loginWithGoogle();
  }
}
