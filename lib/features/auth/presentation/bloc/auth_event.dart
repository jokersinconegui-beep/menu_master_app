abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class CheckAuthEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}