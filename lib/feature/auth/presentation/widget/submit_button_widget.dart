import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/fonts/app_fonts.dart';



class SubmitButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool cheekBackGroundColor;
  const SubmitButtonWidget(
      {super.key,
      this.onPressed,
      required this.text,
      required this.cheekBackGroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      //height: ,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              !cheekBackGroundColor ? AppColors.kGray : AppColors.kBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.h),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.font16Weight500, // Corrected style name
        ),
      ),
    );
  }
}
