  import 'package:app_facul/app/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

const double textLarge = 22;
  const double textNormal = 16;
  const double textSmall = 14;

  const String fontName = 'Montserrat';

class AppTypography{
  static const TextStyle textBodyGreen = TextStyle(
    fontSize: textNormal,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: AppColors.green
  );

  static const TextStyle textBodyWhite = TextStyle(
    fontSize: textNormal,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: AppColors.white
  );

  static const TextStyle textBodyGreenSemiBold = TextStyle(
    fontSize: textNormal,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: AppColors.green
  );

  static const TextStyle textBodyWhiteSemiBold = TextStyle(
    fontSize: textNormal,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: AppColors.white
  );

  static const TextStyle textTitleGreenSemiBold = TextStyle(
    fontSize: textLarge,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: AppColors.green
  );

  static const TextStyle textTitleWhiteSemiBold = TextStyle(
    fontSize: textLarge,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: AppColors.white
  );

  static const TextStyle textError = TextStyle(
    fontSize: textSmall,
    fontWeight: FontWeight.w600,
    fontFamily: fontName,
    color: Colors.red
  );
}