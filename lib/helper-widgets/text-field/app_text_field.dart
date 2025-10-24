import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:present_unit_flutter/helpers/assets_path/assets_path.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';
import 'package:present_unit_flutter/helpers/text-style/text_style.dart';
import 'package:present_unit_flutter/main.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.prefix,
    this.suffix,
    this.hint,
    this.contentPadding,
    this.maxLines,
    this.errorText,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.isPassword = false,
    this.isError = false,
  });

  final TextEditingController controller;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? hint;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool isPassword;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final bool isError;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isEyeOpened = false;

  @override
  void initState() {
    isEyeOpened = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: getColorScheme(context).primary,
      textInputAction: widget.textInputAction,
      showCursor: true,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      enableSuggestions: true,
      obscureText: isEyeOpened,
      inputFormatters: widget.textInputType == TextInputType.phone ? [LengthLimitingTextInputFormatter(10)] : [],
      style: AppTextTheme.defaultTextStyle(fontSize: 15, color: getColorScheme(context).primary,),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hint: widget.hint,
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        enabled: widget.enabled,
        error:
            widget.isError
                ? (widget.errorText ?? "Oops! This field can’t be left blank").textWidget(fontSize: 14,color: getColorScheme(context).error)
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: getColorScheme(context).primary, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: getColorScheme(context).onSurfaceVariant, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: getColorScheme(context).primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: getColorScheme(context).error, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: getColorScheme(context).primary, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: getColorScheme(context).error, width: 1.5),
        ),
        prefixIcon: widget.prefix,
        suffixIcon:
            widget.isPassword
                ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      isEyeOpened = !isEyeOpened;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: SvgPicture.asset(
                      isEyeOpened ? AssetsPaths.eyeOpenSVG : AssetsPaths.eyeCloseSVG,
                      height: 16,
                      width: 16,
                      colorFilter: ColorFilter.mode(getColorScheme(context).onSurface, BlendMode.srcIn),
                    ),
                  ),
                )
                : widget.suffix,
        // suffix:
      ),
    );
  }
}
