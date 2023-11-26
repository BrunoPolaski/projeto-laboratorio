import 'package:app_facul/app/presentation/layout/custom_size.dart';
import 'package:flutter/material.dart';

class CustomRectangleButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const CustomRectangleButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.textStyle,
    required this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? CustomWidth.custom(width!) : null,
      height: height != null ? CustomHeight.custom(height!) : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text,
        style: textStyle),
      ),
    );
  }
}