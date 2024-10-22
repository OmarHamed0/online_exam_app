import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';

import '../../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../../../core/styles/images/app_images.dart';

class SpecificSubjectContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRouteName.startExamScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 90.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.kGray),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImages.profit),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "High level",
                          style: AppFonts.font16BlueWeight500.copyWith(
                              color: AppColors.kBlack,
                              decoration: TextDecoration.none),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 85.w),
                          child: Text("30 Minutes",
                              style: AppFonts.font13BlackWeight400.copyWith(
                                decoration: TextDecoration.none,
                              )),
                        ),
                      ],
                    ),
                    Text(
                      "20 Question",
                      style: AppFonts.font14GrayWeight400
                          .copyWith(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "From 1.00  To 6.00",
                      style: AppFonts.font16BlueWeight500.copyWith(
                          fontSize: 12.sp, decoration: TextDecoration.none),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
