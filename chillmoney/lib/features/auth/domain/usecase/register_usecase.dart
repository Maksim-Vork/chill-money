import 'package:chillmoney/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<void> call(String email, String password) async {
    await authRepository.register(email, password);
  }
}
