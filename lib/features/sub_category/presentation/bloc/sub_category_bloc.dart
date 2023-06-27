import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/sub_category/data/repositories/sub_categories_repo.dart';

import '../../../../utils/connection.dart';
import '../../data/models/sub_category.dart';

part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final networkInfo = NetworkInfo();
  SubCategoryRepository repo;
  SubCategoryBloc(
      {required this.repo, required SubCategoryState subCategoryState})
      : super(SubCategoryInitial()) {
    on<GetAllSubCategories>(
      (event, emit) async {
        emit(SubCategoryGetting());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError());
          if (kDebugMode) {
            print('No connection');
          }
        } else {
          // ignore: non_constant_identifier_names
          final List<SubCategory> sub_categories =
              await repo.getSubCategories(event.sub_categories);
          if (sub_categories.isNotEmpty) {
            emit(SubCategoryGot(sub_categories));
          } else {
            emit(SubCategoryGetError());
          }
        }
      },
    );
  }
}
