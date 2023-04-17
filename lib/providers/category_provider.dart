import 'package:flutter/material.dart';
import 'package:outflow/modal/category_model.dart';
import 'package:outflow/util/database_helper.dart';

class CategoryProvider extends ChangeNotifier {
  final DatabaseHelper dbHelper;

  CategoryProvider({required this.dbHelper});

  List<CategoryModel> _categories = [];

  List<CategoryModel> get catogories => _categories;

  Future<void> getCategories() async {
    _categories = await dbHelper.getAllCategories();
  }

  void addCategory(String categoryName, Color categoryColor) async {
    final newCategory = CategoryModel(
      categoryName: categoryName,
      categoryColor: categoryColor,
      expenseAmount: 0.0,
      date: DateTime.now(),
    );
    _categories.add(newCategory);
    await dbHelper.insertCategory(newCategory);
    notifyListeners();
  }

  // void addExpensesValues(String categoryId, double expAmount) {
  //   final categoryItem = _categories.firstWhere((cat) => cat.id == categoryId);
  //   categoryItem.expenseAmount += expAmount;
  //   notifyListeners();
  // }
}
