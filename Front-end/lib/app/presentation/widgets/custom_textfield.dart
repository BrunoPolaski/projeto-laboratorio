import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final BoxDecoration? decoration;
  final TextStyle? style;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.decoration,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: style,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: style,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.purple,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}