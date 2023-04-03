import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:outflow/view/widgets/add_new_category.dart';
import 'package:outflow/view/widgets/category_grid_view.dart';
import 'package:outflow/view/widgets/total_expenses_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      const TotalExpensesWidget(),
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
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: CategoryGriodView(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
