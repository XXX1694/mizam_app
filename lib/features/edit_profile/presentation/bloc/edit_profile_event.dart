part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class EditProfile extends EditProfileEvent {
  final String name;
  final String email;
  final String number;
  const EditProfile({
    required this.email,
    required this.name,
    required this.number,
  });
}
