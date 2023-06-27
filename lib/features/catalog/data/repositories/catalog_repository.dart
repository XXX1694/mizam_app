// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CatalogRepository {
  final _db = FirebaseFirestore.instance;
  getCategories() async {
    List<Catalog> categoriesList = [];
    await _db.collection("categories").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          Catalog category = Catalog.fromJson(docSnapshot.data());
          categoriesList.add(category);
        }
      },
    );
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return categoriesList;
  }
}
