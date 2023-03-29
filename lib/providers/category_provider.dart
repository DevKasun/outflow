import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> _categories = [];

  List<Category> get catogories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }
}
