// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/sub_category.dart';

class SubSubCategoryRepository {
  getSubCategories(List<String> sub_category_list) async {
    List<SubCategory> subCategoriesList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('sub_sub_categories').get();

    for (var doc in querySnapshot.docs) {
      for (var item in sub_category_list) {
        if (item == doc.id.toString()) {
          if (kDebugMode) {
            print(doc.data());
          }
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          SubCategory subCategory = SubCategory.fromJson(data);
          subCategoriesList.add(subCategory);
        }
      }
    }
    return subCategoriesList;
  }
}
