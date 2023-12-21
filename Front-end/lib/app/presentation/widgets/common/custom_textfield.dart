import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget{
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final BoxDecoration? decoration;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

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
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters:
        inputFormatters,
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
            color: AppColors.green,
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