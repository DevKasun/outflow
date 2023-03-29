import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String name;
  double expenseAmount;
  final Color color;
  final DateTime date;

  Category({
    required this.id,
    required this.name,
    this.expenseAmount = 0,
    required this.color,
    required this.date,
  });
}
