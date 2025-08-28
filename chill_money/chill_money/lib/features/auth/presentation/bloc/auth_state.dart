abstract class AuthState {}

class InititalAuth extends AuthState {}

class LoadingAuth extends AuthState {}

class LoadedAuth extends AuthState {}

class ErrorAuth extends AuthState {
  final String error;

  ErrorAuth({required this.error});
}
