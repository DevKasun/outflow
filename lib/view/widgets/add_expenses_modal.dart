import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/category_provider.dart';

class AddExpenseModal extends StatefulWidget {
  const AddExpenseModal({Key? key, required this.categoryID}) : super(key: key);

  final String categoryID;

  @override
  State<AddExpenseModal> createState() => _AddExpenseModalState();
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  final _formKey = GlobalKey<FormState>();
  double? _exAmount = 0.00;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "Add New expense",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Enter your value",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF202020),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter expense amount",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d{0,2}$'),
                  ),
                ],
                validator: (value) {
                  if (value == '') {
                    return 'Please enter a number';
                  }
                  final num? number =
                      num.tryParse(value!); // Parse the entered value
                  if (number == null) {
                    return 'Please enter a valid number';
                  }
                  _exAmount =
                      number.toDouble(); // Assign the parsed value to _exAmount
                  return null;
                },
                onSaved: (value) {
                  // _exAmount = (value ?? 0.0) as double?;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: const Color(0xFF333533),
                  ),
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      Provider.of<CategoryProvider>(context, listen: false)
                          .addExpensesValues(
                        widget.categoryID,
                        _exAmount!,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
