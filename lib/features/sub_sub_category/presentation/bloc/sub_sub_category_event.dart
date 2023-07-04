part of 'sub_sub_category_bloc.dart';

abstract class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetAllSubSubCategories extends SubCategoryEvent {
  // ignore: non_constant_identifier_names
  final List<String> sub_categories;
  const GetAllSubSubCategories(this.sub_categories);
}
