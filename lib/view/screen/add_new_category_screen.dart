import 'package:flutter/material.dart';
import 'package:outflow/view/widgets/text_form_field.dart';

class AddNewCategoryScreen extends StatefulWidget {
  const AddNewCategoryScreen({super.key});

  @override
  State<AddNewCategoryScreen> createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen> {
  final formKey = GlobalKey<FormState>();

  String categoryName = "";
  Color categoryColor = Color(0xFF202020);
  final List<Color> categoryColors = [
    Color(0xFFF94144),
    Color(0xFFF3722C),
    Color(0xFFF8961E),
    Color(0xFFF9844A),
    Color(0xFFF9C74F),
    Color(0xFF90BE6D),
    Color(0xFF43AA8B),
    Color(0xFF4D908E),
    Color(0xFF577590),
    Color(0xFF277DA1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Category",
          style: TextStyle(
            color: Color(0xFF202020),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Add",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF202020),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 105,
                  decoration: BoxDecoration(
                    color: categoryColor,
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
                    categoryColors.length,
                    (index) {
                      final color = categoryColors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              categoryColor = color;
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            border: categoryColor == color
                                ? Border.all(
                                    width: 2.0,
                                    color: Color(0xFF202020),
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
