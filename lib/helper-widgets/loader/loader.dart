import 'package:flutter/material.dart';
import 'package:present_unit_flutter/main.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        color: color ?? getColorScheme(context).primary,
        strokeWidth: 2,
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
      height: height ?? 24,
      width: width ?? 24,
      child: Center(
        child: Loader(
          color: loaderColor ?? getColorScheme(context).surface,
        ),
      ),
    );
  }
}
