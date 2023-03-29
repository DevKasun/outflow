import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:outflow/view/widgets/add_new_category.dart';
import 'package:outflow/view/widgets/text_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 34,
            color: Color(0xFF202020),
          ),
        ),
        title: const Text(
          "OverFlow",
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFF202020),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 76,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD100),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      _totalExpensesWidget(context),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFF43AA8B),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 25,
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFF277DA1),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFF277DA1),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF8961E),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFF90BE6D),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9C74F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: _categoryGridViewWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _totalExpensesWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 102,
              decoration: BoxDecoration(
                color: const Color(0xFF202020),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "March 2023",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 2.0,
                                ),
                                child: Text(
                                  "LKR",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "34,500",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Lottie.asset(
                        'assets/images/wallet-animation.json',
                        width: 80,
                        height: 90,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _categoryGridViewWidget() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4 + 1,
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
        return Container(
          height: 80,
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 6.0,
            right: 6.0,
            bottom: 16.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF277DA1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: This DAY should be dynamic
                  const Text(
                    "Food",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
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
                children: const [
                  Text(
                    "8,000",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
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
                          Navigator.pop(context); // to close the bottom sheet
                          _addNewCategoryBottomSheet();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            border: categoryColor == color
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
