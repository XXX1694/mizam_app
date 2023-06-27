part of 'sub_category_bloc.dart';

abstract class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetAllSubCategories extends SubCategoryEvent {
  // ignore: non_constant_identifier_names
  final List<String> sub_categories;
  const GetAllSubCategories(this.sub_categories);
}
