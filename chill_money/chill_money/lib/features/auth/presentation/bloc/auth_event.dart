abstract class AuthEvent {}

class ChechAuthEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterEvent({required this.email, required this.password});
}

class LoginWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
