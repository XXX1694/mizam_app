import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/catalog/data/repositories/catalog_repository.dart';

import '../../../../utils/connection.dart';
import '../../data/models/category.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final networkInfo = NetworkInfo();
  CatalogRepository repo;
  CatalogBloc({required this.repo, required CatalogState catalogState})
      : super(CatalogInitial()) {
    on<GetAllCategory>(
      (event, emit) async {
        emit(CatalogGetting());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          final List<Catalog> catalog = await repo.getCategories();
          if (catalog.isNotEmpty) {
            emit(CatalogGot(catalog));
          } else {
            emit(CatalogGetError());
          }
        }
      },
    );
  }
}
