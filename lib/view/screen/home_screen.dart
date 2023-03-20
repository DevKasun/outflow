import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final array1 = [
    {
      "id": 1,
      "day": "Monday",
      "value": "20000"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff202020),
        shadowColor: const Color(0x00202020),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 34,
            color: Color(0xff202020),
          ),
        ),
        title: const Text(
          "OverFlow",
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 72,
                        child: Container(
                          width: 340,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFF202020),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "March 2023",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
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
                                          fontWeight: FontWeight.w600,
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
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(
                          width: 70,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD100),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 50,
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.add_circle_outline_sharp),
                              )
                            ],
                          ),
                        ),
                      )
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
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 1.8,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // TODO: This DAY should be dynamic
                                  const Text(
                                    "Friday",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF), fontSize: 18),
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
                    ),
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
