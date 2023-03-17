import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: const [
              Text("left"),
              Text("Right"),
            ],
          ),
        ],
      ),
    );
  }
}
