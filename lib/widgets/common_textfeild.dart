import 'package:flutter/material.dart';

class CommonTextFeil extends StatelessWidget {
  const CommonTextFeil({
    super.key,
    required this.hinttext,
    required this.label,
    this.suffixicon,
    this.validation = false,
    this.controller,
    this.fillColor,
    this.maxLength,
    this.textInputType,
    this.suffixIcon,
    this.onChanged,
  });
  final String hinttext;
  final String label;
  final Widget? suffixicon;
  final bool? validation;
  final Color? fillColor;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        suffix: suffixicon,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: suffixIcon,
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
