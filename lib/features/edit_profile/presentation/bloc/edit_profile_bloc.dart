import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/edit_profile/data/repositories/edit_profile_repo.dart';

import '../../../../utils/connection.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final networkInfo = NetworkInfo();
  EditProfileRepository repo;
  EditProfileBloc({
    required this.repo,
    required EditProfileState editProfileState,
  }) : super(EditProfileInitial()) {
    on<EditProfile>(
      (event, emit) async {
        emit(ProfileEditing());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          final res =
              await repo.editUserData(event.name, event.number, event.email);
          if (res) {
            emit(ProfileEdited());
          } else {
            emit(ProfileEdirError());
          }
        }
      },
    );
  }
}
