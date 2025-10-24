// import 'package:flutter/material.dart';
// import 'package:present_unit_flutter/helpers/colors/app_color.dart';
// import 'package:present_unit_flutter/helpers/extension/string_widget.dart';
//
// void showSuccessSnackBar({required BuildContext context, required String title, int? durationInMilliseconds}) {
//   ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: Duration(milliseconds: durationInMilliseconds ?? 2000),
//       backgroundColor: AppColors.green,
//       content: title.textWidget(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
//     ),
//   );
// }
//
// void showErrorSnackBar({required BuildContext context, required String title, int? durationInMilliseconds}) {
//   ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: Duration(milliseconds: durationInMilliseconds ?? 2000),
//       backgroundColor: AppColors.red,
//       content: title.textWidget(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white, maxLines: 2),
//     ),
//   );
// }
