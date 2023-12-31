part of 'autharization_bloc.dart';

abstract class AutharizationEvent extends Equatable {
  const AutharizationEvent();

  @override
  List<Object> get props => [];
}

class LogIn extends AutharizationEvent {
  final String emailAddress;
  final String password;
  const LogIn({required this.emailAddress, required this.password});
}

class LogOut extends AutharizationEvent {}

class Register extends AutharizationEvent {
  final String emailAddress;
  final String password;
  final String fullName;
  const Register({
    required this.emailAddress,
    required this.password,
    required this.fullName,
  });
}

class ResetPassword extends AutharizationEvent {
  final String email;
  const ResetPassword(this.email);
}
