import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/authorization/data/models/user.dart';
import 'package:mizam_app/features/profile/data/repositories/profile_repository.dart';

import '../../../../utils/connection.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final networkInfo = NetworkInfo();
  ProfileRepository repo;
  ProfileBloc({
    required this.repo,
    required ProfileState profileState,
  }) : super(ProfileInitial()) {
    on<GetUserData>((event, emit) async {
      emit(ProfileDataGetting());
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        emit(ConnectionError());
        if (kDebugMode) {
          print('No connection');
        }
      } else {
        UserModel? model = await repo.getProfileData();
        if (model != null) {
          emit(ProfileDataGot(model));
        } else {
          emit(ProfileGetError());
        }
      }
    });
  }
}
