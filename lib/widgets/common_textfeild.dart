import 'package:flutter/material.dart';

class CommonTextFeil extends StatelessWidget {
  const CommonTextFeil({
    super.key,
    required this.hinttext,
    required this.label,
    this.suffixicon,
    this.validation = false,
    required this.controller,
  });
  final String hinttext;
  final String label;
  final Widget? suffixicon;
  final bool? validation;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hinttext,
        label: Text(label),
        suffix: suffixicon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (validation == true) {
          if (value == null || value.isEmpty) {
            return hinttext + 'Required';
          }
          return null;
        }
      },
      controller: controller,
    );
  }
}
