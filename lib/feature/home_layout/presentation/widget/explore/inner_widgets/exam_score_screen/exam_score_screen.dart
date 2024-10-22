import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/core/styles/fonts/app_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScoreScreen extends StatelessWidget {
  static String routeName = "ExamScoreScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exam Score",
          style: AppFonts.font20BlackWeight500,
        ),
        leading: Icon(Icons.arrow_back_ios_rounded),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  "Your Score",
                  style:
                      AppFonts.font20BlackWeight500.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 70.00,
                  animation: true,
                  lineWidth: 7.0,
                  percent: 0.80,
                  progressColor: AppColors.kBlue,
                  backgroundColor: AppColors.kRed,
                  center: Text(
                    "80%",
                    style: AppFonts.font20BlackWeight500,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Correct",
                                style: AppFonts.font16BlueWeight500
                                    .copyWith(decoration: TextDecoration.none)),
                            Text(
                              "18",
                              style: AppFonts.font16BlueWeight500.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Correct",
                                style: AppFonts.font16BlueWeight500.copyWith(
                                    decoration: TextDecoration.none,
                                    color: AppColors.kRed)),
                            Text("2",
                                style: AppFonts.font16BlueWeight500.copyWith(
                                    decoration: TextDecoration.none,
                                    color: AppColors.kRed))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 120.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
              backgroundColor: AppColors.kBlue,
              side: BorderSide(color: AppColors.kBlue),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, PageRouteName.resultAnswerScreen);
            },
            child: Text(
              "Show Results",
              style: TextStyle(
                  color: AppColors.kWhite, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 130.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
              backgroundColor: AppColors.kWhite,
              side: BorderSide(color: AppColors.kBlue, width: 1.w),
            ),
            onPressed: () {},
            child: Text(
              "Start again",
              style: TextStyle(
                  color: AppColors.kBlue, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
