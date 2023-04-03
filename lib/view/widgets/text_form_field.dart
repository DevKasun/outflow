import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final String? Function(String?) onValidate;
  final void Function(String?) onSaved;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.isPassword,
      required this.onValidate,
      required this.onSaved});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 4.0,
            color: Color(0xFF202020),
            style: BorderStyle.solid,
          ),
        ),
        hintText: widget.hintText,
      ),
      obscureText: widget.isPassword,
      validator: widget.onValidate,
      onSaved: widget.onSaved,
    );
  }
}
