// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      json['name'] as String?,
      (json['subsub'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['products'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subsub': instance.subsub,
      'products': instance.products,
    };
