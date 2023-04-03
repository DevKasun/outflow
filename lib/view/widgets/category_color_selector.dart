import 'package:flutter/material.dart';
import 'package:outflow/providers/color_provider.dart';
import 'package:provider/provider.dart';

class CategoryColorSelector extends StatelessWidget {
  const CategoryColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 5,
      mainAxisSpacing: 24.0,
      crossAxisSpacing: 24.0,
      children: List.generate(
        context.watch<ColorProvider>().categoryColors.length,
        (index) {
          final color = context.watch<ColorProvider>().categoryColors[index];
          return GestureDetector(
            onTap: () {
              _setCategoryColor(context, color);
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: context.watch<ColorProvider>().selectedColor == color
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
    );
  }

  void _setCategoryColor(context, color) {
    Provider.of<ColorProvider>(context, listen: false).setColor(color);
  }
}
