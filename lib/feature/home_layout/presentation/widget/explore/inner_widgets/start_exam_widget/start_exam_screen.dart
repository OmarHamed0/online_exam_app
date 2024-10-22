import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../../core/styles/images/app_images.dart';

class StartExamScreen extends StatelessWidget {
  static String routeName = "startExamScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageRouteName.getAllExamsScreen);
            },
            child: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AppImages.profit),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Languages",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.kBlack,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Text(
                  "30 Minutes",
                  style: AppFonts.font13BlackWeight400.copyWith(
                      color: AppColors.kBlue, decoration: TextDecoration.none),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                Text(
                  "High level ",
                  style: AppFonts.font18BlackWeight600
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  "|",
                  style: TextStyle(fontSize: 25.sp, color: AppColors.kGray),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "20 Questions",
                  style: AppFonts.font16GrayWeight400,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Instructions",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.kBlack,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10.sp,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetuer.",
                      style: AppFonts.font14BlackWeight400,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 7.h,
                ),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10.sp,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetuer.",
                      style: AppFonts.font14BlackWeight400,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 7.h,
                ),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10.sp,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetuer.",
                      style: AppFonts.font14BlackWeight400,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 7.h,
                ),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10.sp,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetuer.",
                      style: AppFonts.font14BlackWeight400,
                    ),
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteName.questionsScreen);
            },
            child: Text(
              "Start",
              style: AppFonts.font16BlueWeight500
                  .copyWith(color: AppColors.kWhite),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 15.h),
              backgroundColor: AppColors.kBlue,
            ),
          ),
        ],
      ),
    );
  }
}
