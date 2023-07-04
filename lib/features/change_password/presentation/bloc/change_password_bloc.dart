import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/change_password/data/repositories/change_password_repo.dart';

import '../../../../utils/connection.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final networkInfo = NetworkInfo();
  ChangePasswordRepo repo;
  ChangePasswordBloc({
    required this.repo,
    required ChangePasswordState changePasswordState,
  }) : super(ChangePasswordInitial()) {
    on<ChangePassword>(
      (event, emit) async {
        emit(PasswordChanging());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          final res =
              await repo.changePassword(event.oldPassword, event.newPassword);
          if (res) {
            emit(PasswordChanged());
          } else {
            emit(PasswordChangingError());
          }
        }
      },
    );
  }
}
