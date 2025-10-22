import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xff1f41bb);
  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffffffff);
  static Color disableButtonBgColor = AppColors.black.withAlpha((255*0.15).toInt());
  static Color bottomNavigationBarColor = const Color(0xfff4f4f4);
  static Color scaffoldBgColor = const Color(0xfff3f3f3);
  static Color red = const Color(0xffff0000);
  static Color lightRed = const Color(0xffff4040);
  static Color green = const Color(0xff2bbc30);
  static Color darkGreen = const Color(0xff56dd00);
  static Color skyBlue = const Color(0xff00c4c2);
  static Color customLogoOrange = const Color(0xffffad00);
  static Color customPurple = const Color(0xffad5fd6);
  static Color lightBackgroundForCard = const Color(0xfff4f4f4);
  static Color lightTextColor = AppColors.black.withAlpha(
    (255 * 0.6).toInt(),
  );
  static Color unselectedColor = AppColors.black.withAlpha(
    (255 * 0.4).toInt(),
  );
  static Color transparent = Colors.transparent;
}
