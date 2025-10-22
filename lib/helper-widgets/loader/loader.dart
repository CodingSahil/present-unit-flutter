import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:present_unit_flutter/helpers/colors/app_color.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      width: 28.w,
      child: CircularProgressIndicator(
        color: color ?? AppColors.primaryColor,
        strokeWidth: 1.5,
      ),
    );
  }
}

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({
    super.key,
    this.loaderColor,
    this.height,
    this.width,
  });

  final Color? loaderColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 24.h,
      width: width ?? 24.w,
      child: Center(
        child: Loader(
          color: loaderColor ?? AppColors.white,
        ),
      ),
    );
  }
}
