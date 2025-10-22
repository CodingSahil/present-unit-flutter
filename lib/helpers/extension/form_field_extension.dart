import 'package:flutter/material.dart';

extension ConvertFromString on TextEditingController {
  num convertToNum() => text.isNotEmpty ? num.parse(text) : 0;
}
