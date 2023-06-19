part of 'autharization_bloc.dart';

abstract class AutharizationState extends Equatable {
  const AutharizationState();  

  @override
  List<Object> get props => [];
}
class AutharizationInitial extends AutharizationState {}
