import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/connection.dart';
import '../../data/models/sub_category.dart';
import '../../data/repositories/sub_sub_categories_repo.dart';

part 'sub_sub_category_event.dart';
part 'sub_sub_category_state.dart';

class SubSubCategoryBloc extends Bloc<SubCategoryEvent, SubSubCategoryState> {
  final networkInfo = NetworkInfo();
  SubSubCategoryRepository repo;
  SubSubCategoryBloc(
      {required this.repo, required SubSubCategoryState subCategoryState})
      : super(SubSubCategoryInitial()) {
    on<GetAllSubSubCategories>(
      (event, emit) async {
        emit(SubSubCategoryGetting());
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
            emit(SubSubCategoryGot(sub_categories));
          } else {
            emit(SubSubCategoryGetError());
          }
        }
      },
    );
  }
}
