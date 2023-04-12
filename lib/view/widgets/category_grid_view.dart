import 'package:flutter/material.dart';
import 'package:outflow/providers/category_provider.dart';
import 'package:outflow/view/widgets/add_expenses_modal.dart';
import 'package:outflow/view/widgets/add_new_category.dart';
import 'package:provider/provider.dart';

class CategoryGriodView extends StatelessWidget {
  const CategoryGriodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryItems = Provider.of<CategoryProvider>(context).catogories;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: categoryItems.length + 1,
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
        final category = categoryItems[index - 1];
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return AddExpenseModal(categoryID: category.id);
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
              color: category.categoryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.categoryName,
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
                      category.expenseAmount.toStringAsFixed(2),
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
}
