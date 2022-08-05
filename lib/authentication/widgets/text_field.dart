import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/utils/app_colors.dart';

class InputWidget extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final Function(String? value)? onFieldSubmitted;
  final Function(String? value)? onSaved;
  final bool obscureText;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? borderSideColor;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final int? maxLength;
  final int? maxLinesForced;
  final int? maxLengthInLine;
  final bool? isEnable;
  final TextStyle? textStyle;
  final Function(String? value)? onChange;
  final bool? available;
  final bool isPassword, isBio, isTransferPoints, isUserName, isEditReview;

  const InputWidget(
      {Key? key,
      this.initialValue,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.textInputAction,
      this.textDirection,
      this.validator,
      this.onFieldSubmitted,
      this.onSaved,
      this.obscureText = false,
      this.focusNode,
      this.textAlign,
      this.borderColor,
      this.controller,
      this.margin,
      this.maxLengthInLine,
      this.maxLinesForced,
      this.isEnable,
      this.borderRadius,
      this.maxLines,
      this.maxLength,
      this.borderSideColor,
      this.textStyle,
      this.available,
      this.isPassword = false,
      this.isBio = false,
      this.isTransferPoints = false,
      this.isUserName = false,
      this.isEditReview = false,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          textDirection: textDirection,
          textAlign: textAlign ?? TextAlign.start,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: isEnable,
          maxLines: maxLines ?? 1,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          minLines: 1,
          scrollPadding: const EdgeInsets.all(0.0),
          onChanged: onChange,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              fillColor: const Color(0xffEDEFF3),
              hintText: hintText,
              isDense: true,
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 14, color: const Color(0xff686C73)),
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(minHeight: 24),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red)),
              focusedBorder: OutlineInputBorder(
                  borderSide: available == null
                      ? BorderSide(color: AppColors.accentColor)
                      : BorderSide(
                          color: available!
                              ? AppColors.accentColor
                              : AppColors.red)),
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
              )),
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText != false ? obscureText : false,
          cursorColor: AppColors.accentColor,
          focusNode: focusNode,
          autocorrect: false,
          style: textStyle ??
              const TextStyle(color: AppColors.primaryColor, fontSize: 14),
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          textInputAction: textInputAction),
    );
  }
}
