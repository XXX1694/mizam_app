import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/authorization/data/repositories/auth_repo.dart';

import '../../../../utils/connection.dart';

part 'autharization_event.dart';
part 'autharization_state.dart';

class AutharizationBloc extends Bloc<AutharizationEvent, AutharizationState> {
  final networkInfo = NetworkInfo();
  AuthRepo repo;

  AutharizationBloc({
    required this.repo,
    required AutharizationState userState,
  }) : super(AutharizationInitial()) {
    on<LogIn>(
      (event, emit) async {
        emit(UserEntering());
        if (kDebugMode) {
          print('Loging');
        }
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          final String res = await repo.signInWithEmailAndPassowrd(
              event.emailAddress, event.password);
          if (res == 'success') {
            emit(UserOnline());
            if (kDebugMode) {
              print('user_online');
            }
          } else if (res == 'No user found for that email.') {
            emit(NoUserError(message: res));
          } else if (res == 'Wrong password provided for that user.') {
            emit(PasswordError(message: res));
          } else {
            emit(OtherError());
          }
        }
      },
    );
  }
}
