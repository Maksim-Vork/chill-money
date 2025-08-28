import 'package:chill_money/features/auth/domain/repository/auth_repository.dart';

class CheckAuthUserUsecase {
  final AuthRepository authRepository;

  CheckAuthUserUsecase({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.checkAuthUser();
  }
}
