import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../question_screen/questions_screen.dart';

class StartExamContainer extends StatelessWidget {
  final String examId;
  final String examName;
  final String duration;
  final String minutes;
  final String noOfQuestions;
  final String subjectIcon;
  StartExamContainer({
    required this.examId,
    required this.examName,
    required this.duration,
    required this.minutes,
    required this.subjectIcon,
    required this.noOfQuestions,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: SizedBox(
                      width: 52.0.w,
                      height: 47.0.h,
                      child: Image.network(
                        subjectIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(examName,
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.kBlack,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Text(
                "${minutes} Minutes",
                style: AppFonts.font13BlackWeight400.copyWith(
                    color: AppColors.kBlue, decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            children: [
              Text(
                examName,
                style: AppFonts.font18BlackWeight600
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "|",
                style: TextStyle(fontSize: 25.sp, color: AppColors.kGray),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "${noOfQuestions} Questions",
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => QuestionsScreen(
                          examId: examId.toString(),
                          examName: examName.toString(),
                          duration: duration.toString(),
                        )));
          },
          child: Text(
            "Start",
            style:
                AppFonts.font16BlueWeight500.copyWith(color: AppColors.kWhite),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 15.h),
            backgroundColor: AppColors.kBlue,
          ),
        ),
      ],
    );
  }
}
