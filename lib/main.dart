import 'package:flutter/material.dart';
import 'package:outflow/app.dart';
import 'package:outflow/providers/category_provider.dart';
import 'package:outflow/providers/color_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorProvider>(
          create: (_) => ColorProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        )
      ],
      child: const App(),
    ),
  );
}
