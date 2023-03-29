import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:outflow/providers/color_provider.dart';
import 'package:outflow/view/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({super.key});

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  final formKey = GlobalKey<FormState>();

  String categoryName = "";

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
                  onValidate: (String? value) {},
                  onSaved: (String? value) {},
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
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 24.0,
                  children: List.generate(
                    context.watch<ColorProvider>().categoryColors.length,
                    (index) {
                      final color =
                          context.watch<ColorProvider>().categoryColors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              context.read<ColorProvider>().setColor(color);
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            border:
                                context.watch<ColorProvider>().selectedColor ==
                                        color
                                    ? Border.all(
                                        width: 2.0,
                                        color: const Color(0xFF202020),
                                      )
                                    : null,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ElevatedButton(
                    onPressed: () {},
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
        );
      },
    );
  }
}
