import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Catalog {
  final String? name;
  // ignore: non_constant_identifier_names
  final List<String>? sub_category;

  Catalog(this.name, this.sub_category);
  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogToJson(this);
}
