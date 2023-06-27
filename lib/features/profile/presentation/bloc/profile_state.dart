part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ConnectionError extends ProfileState {}

class ProfileDataGetting extends ProfileState {}

class ProfileDataGot extends ProfileState {
  final UserModel model;

  const ProfileDataGot(this.model);
}

class ProfileGetError extends ProfileState {}
