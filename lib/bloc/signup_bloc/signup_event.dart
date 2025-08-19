
part of 'signup_bloc.dart';
@immutable
abstract class SignupEvent {}


class SignupSubmittedEvent extends SignupEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignupSubmittedEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class SignupReset extends SignupEvent {}
