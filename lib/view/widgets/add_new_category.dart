import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outflow/providers/category_provider.dart';
import 'package:outflow/providers/color_provider.dart';
import 'package:outflow/view/widgets/category_color_selector.dart';
import 'package:outflow/view/widgets/text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:outflow/modal/category_model.dart';
import 'package:uuid/uuid.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({super.key});

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  final formKey = GlobalKey<FormState>();
  String _categoryName = "";

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add_circle,
        size: 50.0,
        color: Color(0xFF333533),
      ),
      onPressed: () {
        _addNewCategoryBottomSheet();
      },
    );
  }

  _addNewCategoryBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          // height: 200,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        "Add New Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 105,
                    decoration: BoxDecoration(
                      color: context.watch<ColorProvider>().selectedColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text(
                    "Category name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    hintText: "Category name",
                    isPassword: false,
                    onValidate: (String? value) {
                      if (value != null) {
                        if (value.isEmpty) {
                          return "Please enter valid name";
                        }
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _categoryName = value ?? "";
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text(
                    "Category name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CategoryColorSelector(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ElevatedButton(
                      onPressed: () => _submitNewCategory(context),
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
                      child: const Text("Add category"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _submitNewCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final newCategory = CategoryModel(
        id: const Uuid().v4(),
        categoryName: _categoryName,
        categoryColor: context.read<ColorProvider>().selectedColor,
        expenseAmount: 0.0,
        date: DateTime.now(),
      );
      Provider.of<CategoryProvider>(context, listen: false)
          .addCategory(newCategory);
      Provider.of<ColorProvider>(context, listen: false).resetColor();
      Navigator.pop(context);
    }
  }
}
