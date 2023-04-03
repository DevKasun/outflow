import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CategoryModel {
  final String id;
  final String categoryName;
  final Color categoryColor;
  final double expenseAmount;
  final DateTime date;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryColor,
    required this.expenseAmount,
    required this.date,
  });
}
