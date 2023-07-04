part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePassword extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;
  const ChangePassword({required this.newPassword, required this.oldPassword});
}
