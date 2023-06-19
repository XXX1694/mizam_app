import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'autharization_event.dart';
part 'autharization_state.dart';

class AutharizationBloc extends Bloc<AutharizationEvent, AutharizationState> {
  AutharizationBloc() : super(AutharizationInitial()) {
    on<AutharizationEvent>((event, emit) {});
  }
}
