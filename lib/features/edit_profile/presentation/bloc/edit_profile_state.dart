part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class ConnectionError extends EditProfileState {}

class ProfileEditing extends EditProfileState {}

class ProfileEdited extends EditProfileState {}

class ProfileEdirError extends EditProfileState {}
