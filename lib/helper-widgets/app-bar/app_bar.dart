import 'package:flutter/material.dart';
import 'package:present_unit_flutter/helpers/colors/app_color.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';

PreferredSizeWidget commonAppBarPreferred({
  required String label,
  required BuildContext context,
  bool isBack = true,
  bool isAdd = true,
  bool isSave = false,
  Widget? saveWidget,
  void Function()? onTap,
  void Function()? onSave,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    surfaceTintColor: AppColors.primaryColor,
    leading: isBack
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white, size: 36),
          )
        : null,
    title: label.textWidget(fontSize: 16, color: AppColors.white),
    actions: [
      if (isAdd && onTap != null)
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Icon(Icons.add, color: AppColors.white, size: 44),
        )
      else if (isSave && saveWidget != null)
        GestureDetector(onTap: onSave, behavior: HitTestBehavior.translucent, child: saveWidget)
      else
        const SizedBox.shrink(),
      SizedBox(width: 28),
    ],
    bottom: bottom,
  );
}

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key, required this.label, this.isBack = true, this.isAdd = true, this.onTap});

  final String label;
  final bool isBack;
  final bool isAdd;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      automaticallyImplyLeading: false,

      leading: isBack
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white, size: 36),
            )
          : null,
      title: label.textWidget(fontSize: 16, color: AppColors.white),
      actions: [
        if (isAdd && onTap != null)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTap,
            child: Icon(Icons.add, color: AppColors.white, size: 44),
          ),
        SizedBox(width: 28),
      ],
    );
  }
}
