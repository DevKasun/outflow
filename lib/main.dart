import 'package:flutter/material.dart';
import 'package:outflow/app.dart';
import 'package:outflow/providers/color_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider())
      ],
      child: const App(),
    ),
  );
}
