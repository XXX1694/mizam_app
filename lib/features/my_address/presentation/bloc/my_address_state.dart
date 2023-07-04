part of 'my_address_bloc.dart';

class MyAddressState extends Equatable {
  const MyAddressState();

  @override
  List<Object> get props => [];
}

class MyAddressInitial extends MyAddressState {}

class ConnectionError1 extends MyAddressState {}

class AddressAdding extends MyAddressState {}

class AddressAdded extends MyAddressState {}

class AddressAddError extends MyAddressState {}

class AddressDeleting extends MyAddressState {}

class AddressDeleted extends MyAddressState {}

class AddressDeleteError extends MyAddressState {}
