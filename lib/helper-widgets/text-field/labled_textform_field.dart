import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:present_unit_flutter/helpers/assets_path/assets_path.dart';
import 'package:present_unit_flutter/helpers/colors/app_color.dart';
import 'package:present_unit_flutter/helpers/text-style/text_style.dart';

class LabeledTextFormField extends StatefulWidget {
  const LabeledTextFormField({
    super.key,
    this.labelText,
    required this.controller,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    this.errorMessage,
    this.onEditingComplete,
    this.enable = true,
    this.isError = false,
    this.isCurrencyBeforeText = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.showBorder = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.showRedTextColor = false,
    this.isAmountField = false,
    this.isOptionalFields = false,
    this.isCancel = false,
    this.isPasswordField = false,
    this.focusNode,
    this.onClose,
    this.onTap,
    this.suffix,
  });

  final String? labelText;
  final String? errorMessage;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool enable;
  final bool isError;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final bool isCurrencyBeforeText;
  final bool showBorder;
  final bool showRedTextColor;
  final bool isAmountField;
  final bool isOptionalFields;
  final bool isCancel;
  final bool isPasswordField;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final void Function()? onClose;
  final Widget? suffix;

  @override
  State<LabeledTextFormField> createState() => _LabeledTextFormFieldState();
}

class _LabeledTextFormFieldState extends State<LabeledTextFormField> {
  bool isEyeOpen = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enable,
      controller: widget.controller,
      cursorColor: AppColors.black,
      cursorWidth: 1,
      keyboardType: widget.textInputType,
      maxLines: widget.maxLines,
      obscureText: widget.isPasswordField && !isEyeOpen,
      obscuringCharacter: '*',
      onEditingComplete: widget.onEditingComplete,
      inputFormatters: widget.isAmountField
          ? <TextInputFormatter>[
              LengthLimitingTextInputFormatter(8),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ]
          : widget.textInputType == TextInputType.emailAddress
              ? <TextInputFormatter>[
                  AllLowerCaseCaseTextFormatter(),
                ]
              : widget.textInputType == TextInputType.phone
                  ? <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(10),
                    ]
                  : widget.textInputType == TextInputType.url
                      ? <TextInputFormatter>[
                          AllLowerCaseCaseTextFormatter(),
                        ]
                      : <TextInputFormatter>[
                          UpperCaseTextFormatter(),
                        ],
      onTap: widget.onTap,
      style: AppTextTheme.defaultTextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 24,
        color: widget.showRedTextColor ? AppColors.red : AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        filled: !widget.enable,
        fillColor: Colors.transparent,
        labelText: widget.labelText != null && widget.labelText!.isNotEmpty ? '${widget.labelText} ${widget.isOptionalFields ? '(Optional)' : ''}' : null,
        hintText: widget.hintText,
        errorText: widget.isError ? widget.errorMessage ?? '${widget.hintText} is required' : null,
        errorMaxLines: 5,
        errorStyle: AppTextTheme.defaultTextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24,
          color: AppColors.red,
        ),
        prefixText: widget.isCurrencyBeforeText ? '₹ ' : null,
        prefixStyle: TextStyle(
          color: widget.showRedTextColor ? AppColors.red : AppColors.lightTextColor.withAlpha((255 * 0.5).toInt()),
        ),
        labelStyle: AppTextTheme.defaultTextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24,
          color: AppColors.black,
        ),
        hintStyle: AppTextTheme.defaultTextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 24,
          color: AppColors.black.withAlpha(
            (255 * 0.5).toInt(),
          ),
        ),
        suffixIcon: widget.suffix != null
            ? widget.suffix!
            : widget.isCancel
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: widget.onClose,
                    child: Icon(
                      Icons.cancel,
                      color: AppColors.red,
                      size: 28.h,
                    ),
                  )
                : widget.isPasswordField
                    ? GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() => isEyeOpen = !isEyeOpen);
                        },
                        child: isEyeOpen
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 24.h,
                                  horizontal: 8.w,
                                ),
                                height: 30.h,
                                width: 30.w,
                                child: SvgPicture.asset(
                                  AssetsPaths.eyeOpenSVG,
                                  // height: Dimens.height24,
                                  // width: Dimens.width24,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.black.withAlpha(
                                      (255 * 0.75).toInt(),
                                    ),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 24.h,
                                  horizontal: 8.w,
                                ),
                          height: 30.h,
                          width: 30.w,
                                child: SvgPicture.asset(
                                  AssetsPaths.eyeCloseSVG,
                                  // height: Dimens.height24,
                                  // width: Dimens.width24,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.black.withAlpha(
                                      (255 * 0.75).toInt(),
                                    ),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                      )
                    : null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          borderSide: BorderSide(
            color: widget.showBorder ? AppColors.primaryColor : AppColors.transparent,
            width: widget.showBorder ? 1.w : 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          borderSide: BorderSide(
            color: widget.showBorder
                ? widget.isError
                    ? AppColors.red
                    : AppColors.lightTextColor.withAlpha((255 * 0.5).toInt())
                : AppColors.transparent,
            width: widget.showBorder ? 1.w : 0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20.r,

          ),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20.r,

          ),
          borderSide: BorderSide(
            color: AppColors.red,
            width: 1.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20.r,

          ),
          borderSide: BorderSide(
            color: AppColors.red,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

class NormalCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}

class AllUpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class AllLowerCaseCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  // if (value.trim().isEmpty) return "";
  // return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  List<String> words = value.split(' ');
  List<String> capitalizedWords = words.map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1);
    } else {
      return word;
    }
  }).toList();
  return capitalizedWords.join(' ');
}
