import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String categoryName;
  final Color categoryColor;
  double expenseAmount;
  final DateTime date;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryColor,
    required this.expenseAmount,
    required this.date,
  });
}
