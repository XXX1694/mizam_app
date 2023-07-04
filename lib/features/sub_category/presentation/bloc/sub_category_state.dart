part of 'sub_category_bloc.dart';

class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object> get props => [];
}

class SubCategoryInitial extends SubCategoryState {}

class ConnectionError extends SubCategoryState {}

class SubCategoryGetting extends SubCategoryState {}

class SubCategoryGot extends SubCategoryState {
  // ignore: non_constant_identifier_names
  final List<SubCategory>? sub_category_list;
  const SubCategoryGot(this.sub_category_list);
}

class SubCategoryGetError extends SubCategoryState {}
