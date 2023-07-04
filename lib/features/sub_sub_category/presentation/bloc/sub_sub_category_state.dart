part of 'sub_sub_category_bloc.dart';

class SubSubCategoryState extends Equatable {
  const SubSubCategoryState();

  @override
  List<Object> get props => [];
}

class SubSubCategoryInitial extends SubSubCategoryState {}

class ConnectionError extends SubSubCategoryState {}

class SubSubCategoryGetting extends SubSubCategoryState {}

class SubSubCategoryGot extends SubSubCategoryState {
  // ignore: non_constant_identifier_names
  final List<SubCategory>? sub_category_list;
  const SubSubCategoryGot(this.sub_category_list);
}

class SubSubCategoryGetError extends SubSubCategoryState {}
