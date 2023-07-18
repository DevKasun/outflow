import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outflow/app.dart';    
import 'package:outflow/model/expense_model.dart';
import 'package:outflow/providers/category_provider.dart';
import 'package:outflow/providers/color_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<ExpenseModel>(ExpenseModelAdapter());
  await Hive.openBox<ExpenseModel>('expenseBox');

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
