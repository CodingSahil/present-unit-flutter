import 'package:flutter/cupertino.dart';

class AppTextTheme {
  static TextStyle defaultTextStyle({required double fontSize, required Color color, FontWeight? fontWeight}) =>
      TextStyle(color: color, fontWeight: fontWeight ?? FontWeight.w500, fontSize: fontSize, fontFamily: "FiraSans");
}
