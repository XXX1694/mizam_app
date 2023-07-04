import 'package:json_annotation/json_annotation.dart';

part 'sub_category.g.dart';

@JsonSerializable()
class SubCategory {
  final String? name;
  // ignore: non_constant_identifier_names
  final List<String>? subsub;
  final List<String>? products;

  SubCategory(this.name, this.subsub, this.products);
  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}
