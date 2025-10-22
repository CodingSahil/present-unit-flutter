import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:present_unit_flutter/helpers/colors/app_color.dart';
import 'package:present_unit_flutter/helpers/extension/double_widget.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';

import 'labled_textform_field.dart';

class AppTextFormFieldsWithLabel extends StatefulWidget {
  const AppTextFormFieldsWithLabel({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.isError,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.isPasswordField = false,
    this.errorMessage,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final String? errorMessage;
  final bool isError;
  final bool isPasswordField;
  final void Function(String value) onChanged;
  final void Function(String value) onFieldSubmitted;

  @override
  State<AppTextFormFieldsWithLabel> createState() => _AppTextFormFieldsWithLabelState();
}

class _AppTextFormFieldsWithLabelState extends State<AppTextFormFieldsWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: widget.hintText.textWidget(fontSize: 14, color: AppColors.black),
        ),
        12.height,
        LabeledTextFormField(
          controller: widget.textEditingController,
          hintText: widget.hintText.toLowerCase().contains('enter') ? widget.hintText : 'Enter ${widget.hintText}',
          isError: widget.isError,
          errorMessage: widget.errorMessage != null && widget.errorMessage!.isNotEmpty ? widget.errorMessage : null,
          isPasswordField: widget.isPasswordField,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ],
    );
  }
}
