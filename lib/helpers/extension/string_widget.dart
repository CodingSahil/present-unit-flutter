import 'package:flutter/material.dart';
import 'package:present_unit_flutter/helpers/text-style/text_style.dart';

extension StringWidget on String {
  Widget textWidget({
    required double fontSize,
    required Color color,
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.visible,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: AppTextTheme.defaultTextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
