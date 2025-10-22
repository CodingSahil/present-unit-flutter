import 'dart:developer';

import 'package:flutter/foundation.dart';

extension StringPrint on String {
  logOnString(String name) {
    if (kDebugMode) {
      log(
        this,
        name: name,
      );
    }
  }
}
