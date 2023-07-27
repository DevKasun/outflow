import 'package:flutter/material.dart';
import 'package:outflow/data_store/data_store.dart';

class DeleteCategoryModel extends StatefulWidget {
  const DeleteCategoryModel({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<DeleteCategoryModel> createState() => _DeleteCategoryModelState();
}

class _DeleteCategoryModelState extends State<DeleteCategoryModel> {
  final ExpenseDataStore _expenseDataStore = ExpenseDataStore();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  "Delete Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: const Color(0xFFFF0054),
                    ),
                    onPressed: () => {_deleteCategory()},
                    child: const Text("Delete"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: const Color(0xFF333533),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteCategory() async {
    await _expenseDataStore.deleteCategory(index: widget.index);
    Navigator.pop(context);
  }
}
