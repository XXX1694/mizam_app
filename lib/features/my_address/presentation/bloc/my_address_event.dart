part of 'my_address_bloc.dart';

abstract class MyAddressEvent extends Equatable {
  const MyAddressEvent();

  @override
  List<Object> get props => [];
}

class GetAllAddress extends MyAddressEvent {}

class AddAddress extends MyAddressEvent {
  final String address;
  const AddAddress(this.address);
}

class DeleteAddress extends MyAddressEvent {
  final List<String> address;
  const DeleteAddress(this.address);
}
