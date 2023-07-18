import 'package:hive_flutter/hive_flutter.dart';
import 'package:outflow/model/expense_model.dart';

class ExpenseDataStore {
  static const expenseDataBox = 'expenseBox';

  static Future<Box<ExpenseModel>> get box async {
    await Hive.openBox<ExpenseModel>(expenseDataBox);
    return Hive.box<ExpenseModel>(expenseDataBox);
  }

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseModelAdapter());
    await Hive.openBox<ExpenseModel>(expenseDataBox);
  }

  Future<void> addcategory({required ExpenseModel expenseModel}) async {
    final box = await ExpenseDataStore.box;
    await box.add(expenseModel);
  }

  Future<void> getCategories({required String id}) async {
    final box = await ExpenseDataStore.box;
    box.get(id);
  }

  Future<void> updateCategory({required int index}) async {
    final box = await ExpenseDataStore.box;
    box.getAt(index);
  }

  Future<void> deleteCategory({required int index}) async {
    final box = await ExpenseDataStore.box;
    await box.deleteAt(index);
  }
}
