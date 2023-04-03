import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outflow/modal/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  // final List<Category> _categories = [];

  final List<CategoryModel> _categories = [];

  List<CategoryModel> get catogories => _categories;

  void addCategory(CategoryModel category) {
    _categories.add(category);
    notifyListeners();
  }
}
