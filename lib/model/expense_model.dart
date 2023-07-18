import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  final String categoryName;

  @HiveField(1)
  int categoryColor;

  @HiveField(2)
  double expenseAmount;

  @HiveField(3)
  final String date;

  ExpenseModel({
    required this.categoryName,
    required this.categoryColor,
    required this.expenseAmount,
    required this.date,
  });
}
