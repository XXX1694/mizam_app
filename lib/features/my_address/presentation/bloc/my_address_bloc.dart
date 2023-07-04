import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/my_address/data/repositories/my_address_repo.dart';

import '../../../../utils/connection.dart';

part 'my_address_event.dart';
part 'my_address_state.dart';

class MyAddressBloc extends Bloc<MyAddressEvent, MyAddressState> {
  final networkInfo = NetworkInfo();
  MyAddressRepo repo;
  MyAddressBloc({
    required this.repo,
    required MyAddressState myAddressState,
  }) : super(MyAddressInitial()) {
    on<AddAddress>(
      (event, emit) async {
        emit(AddressAdding());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError1());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          final res = await repo.addAddress(event.address);
          if (res) {
            emit(AddressAdded());
          } else {
            emit(AddressAddError());
          }
        }
      },
    );

    on<DeleteAddress>(
      (event, emit) async {
        emit(AddressDeleting());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError1());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          final res = await repo.deleteAddress(event.address);
          if (res) {
            emit(AddressDeleted());
          } else {
            emit(AddressDeleteError());
          }
        }
      },
    );
  }
}
