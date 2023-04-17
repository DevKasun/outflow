import 'package:flutter/material.dart';

final String tableCategories = "category";

class CategoryFields {
  static final String id = "_id";
  static final String categoryName = "_categoryName";
  static final String CategoryColor = "_categoryColor";
  static final String expenseAmount = "_expenseAmount";
  static final String date = "_date";
}

class CategoryModel {
  final int? id;
  final String categoryName;
  final Color categoryColor;
  double? expenseAmount;
  final DateTime? date;

  CategoryModel({
    this.id,
    required this.categoryName,
    required this.categoryColor,
    this.expenseAmount,
    this.date,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json[CategoryFields.id],
      categoryName: json[CategoryFields.categoryName],
      categoryColor: Color(int.parse(json[CategoryFields.CategoryColor])),
      expenseAmount: json[CategoryFields.expenseAmount],
      date: DateTime.parse(json[CategoryFields.date]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryFields.id: id,
      CategoryFields.categoryName: categoryName,
      CategoryFields.CategoryColor: categoryColor.value.toString(),
      CategoryFields.expenseAmount: expenseAmount,
      CategoryFields.date: date!.toIso8601String(),
    };
  }

  CategoryModel copyWith({
    int? id,
    String? categoryName,
    Color? categoryColor,
    double? expenseAmount,
    DateTime? date,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      categoryColor: categoryColor ?? this.categoryColor,
      expenseAmount: expenseAmount ?? this.expenseAmount,
      date: date ?? this.date,
    );
  }

  static CategoryModel withDefaults({
    required String categoryName,
    required Color categoryColor,
  }) {
    return CategoryModel(
      id: 1,
      categoryName: "",
      categoryColor: Colors.blue,
      expenseAmount: 0.0,
      date: DateTime.now(),
    );
  }
}
