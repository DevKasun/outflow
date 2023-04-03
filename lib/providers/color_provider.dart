import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _selectedColor = const Color(0xFF202020);

  final List<Color> _categoryColors = const [
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

  List<Color> get categoryColors => _categoryColors;

  Color get selectedColor => _selectedColor;

  void setColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void resetColor() {
    _selectedColor = const Color(0xFF202020);
  }
}
