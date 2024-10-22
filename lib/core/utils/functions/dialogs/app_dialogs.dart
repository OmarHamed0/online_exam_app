import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/core/styles/fonts/app_fonts.dart';
import 'package:online_exam/core/styles/images/app_images.dart';

class AppDialogs {
  static Future<void> showLoading({
    required BuildContext context,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return Lottie.asset(
            AppImages.loading1,
            height: 10.h,
            width: 10.w,
          );
        });
  }

  static void showErrorDialog(
      {required BuildContext context, required String errorMassage}) {showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.kWhite,
        icon: Lottie.asset(AppImages.error, width: 70.w, height: 50.h),
        content: Text(
          textAlign: TextAlign.center,
          errorMassage,
          style: AppFonts.font18BlackWeight600,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Got it',
              style: AppFonts.font16GrayWeight400,
            ),
          ),
        ],
      ),
    );
  }

  static void showTimedOut({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.kWhite,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.sandClock),
                  SizedBox(width: 5.w),
                  Text('Time out !!',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kError),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 50.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r)),
                  backgroundColor: AppColors.kBlue,
                  side: BorderSide(color: AppColors.kBlue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, PageRouteName.examScoreScreen,);
                },
                child: Text(
                  "View Score",
                  style: TextStyle(color: AppColors.kWhite,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
