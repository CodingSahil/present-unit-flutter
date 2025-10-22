import 'package:flutter/cupertino.dart';
import 'package:present_unit_flutter/helpers/colors/app_color.dart';

class AppTextTheme {
  static TextStyle defaultTextStyle({required double fontSize, Color? color, FontWeight? fontWeight}) => TextStyle(
    color: color ?? AppColors.black,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize,
    fontFamily: "FiraSans",
  );
}
