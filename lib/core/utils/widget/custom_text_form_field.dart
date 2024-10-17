import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors/app_colors.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final TextInputType inputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final int maxLine;
  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.isObscureText = false,
    this.inputType = TextInputType.none,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLine = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: inputType,
      obscureText: isObscureText,
      maxLines: maxLine,
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: true,
          errorMaxLines: 1,
          helperMaxLines: 1,
          fillColor: AppColors.kWhite,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.kDarkGray,
          ),
          suffixIcon: suffixIcon,
          labelText: labelText,
          enabled: true,
          labelStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.kDarkGray,
          ),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kRed,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 17,
          )),
    );
  }
}
