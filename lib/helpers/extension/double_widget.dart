import 'package:flutter/material.dart';

extension SizedBoxWidget on double {
  Widget get width => SizedBox(width: this);
  Widget get height => SizedBox(height: this);
}

extension SizedBoxWidgetInteger on int {
  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());
}