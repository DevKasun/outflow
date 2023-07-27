import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outflow/data_store/data_store.dart';
import 'package:outflow/model/expense_model.dart';
import 'package:outflow/view/widgets/add_expenses_model.dart';
import 'package:outflow/view/widgets/add_new_category.dart';
import 'package:outflow/view/widgets/delete_category_model.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({Key? key}) : super(key: key);

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  // final ExpenseDataStore _dataStore = ExpenseDataStore();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<ExpenseModel>(ExpenseDataStore.expenseDataBox).listenable(),
      builder: (context, Box<ExpenseModel> box, _) {
        final List<ExpenseModel> expenses =
            box.values.toList().cast<ExpenseModel>();
        return GridView.builder(
          shrinkWrap: true,
          itemCount: expenses.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 1.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD100),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const AddNewCategory(),
              );
            }
            final expense = expenses[index - 1];
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return AddExpenseModal(categoryID: expense.categoryName);
                  },
                );
              },
              child: Container(
                height: 80,
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 6.0,
                  right: 6.0,
                  bottom: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Color(expense.categoryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          expense.categoryName,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return DeleteCategoryModel(index: index - 1);
                              },
                            );
                          },
                          icon: const Icon(
                            color: Color(0xFFFFFFFF),
                            Icons.pending,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          expense.expenseAmount.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
