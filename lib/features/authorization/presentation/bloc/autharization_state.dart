part of 'autharization_bloc.dart';

class AutharizationState extends Equatable {
  const AutharizationState();

  @override
  List<Object> get props => [];
}

class AutharizationInitial extends AutharizationState {}

class UserOnline extends AutharizationState {}

class UserEntering extends AutharizationState {}

class UserCreating extends AutharizationState {}

class UserOffline extends AutharizationState {}

class UserExiting extends AutharizationState {}

class RegisterError extends AutharizationState {
  final String message;
  const RegisterError({required this.message});
}

class NoUserError extends AutharizationState {
  final String message;
  const NoUserError({required this.message});
}

class PasswordError extends AutharizationState {
  final String message;
  const PasswordError({required this.message});
}

class PasswordWeak extends AutharizationState {
  final String message;
  const PasswordWeak({required this.message});
}

class UserExist extends AutharizationState {
  final String message;
  const UserExist({required this.message});
}

class OtherError extends AutharizationState {}

class ConnectionError extends AutharizationState {}

class ResetSending extends AutharizationState {}

class ResetSend extends AutharizationState {}

class ResetSendError extends AutharizationState {}
