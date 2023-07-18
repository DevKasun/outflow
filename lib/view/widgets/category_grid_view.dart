import 'package:flutter/material.dart';
import 'package:outflow/data_store/data_store.dart';
import 'package:outflow/model/expense_model.dart';
import 'package:outflow/view/widgets/add_expenses_modal.dart';
import 'package:outflow/view/widgets/add_new_category.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({Key? key}) : super(key: key);

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExpenseModel>>(
      future: ExpenseDataStore.box.then((box) => box.values.toList()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final expenses = snapshot.data ?? [];
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
                            onPressed: () {},
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
        }
      },
    );
  }
}
