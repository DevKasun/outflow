import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outflow/model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> get catogories => _categories;

  void addCategory(CategoryModel category) {
    _categories.add(category);
    notifyListeners();
  }

  void addExpensesValues(String categoryId, double expAmount) {
    final categoryItem = _categories.firstWhere((cat) => cat.id == categoryId);
    categoryItem.expenseAmount += expAmount;
    notifyListeners();
  }
}
