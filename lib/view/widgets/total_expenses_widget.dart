import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:outflow/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TotalExpensesWidget extends StatelessWidget {
  const TotalExpensesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).catogories;
    final now = DateTime.now();
    final formattedDate = DateFormat("MMMM, yyyy").format(now);

    double totalExpenses = 0.00;

    for (final category in categories) {
      totalExpenses += category.expenseAmount;
    }

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
                          Text(
                            "${formattedDate}",
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Padding(
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
                              const SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                '$totalExpenses',
                                style: const TextStyle(
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
}
