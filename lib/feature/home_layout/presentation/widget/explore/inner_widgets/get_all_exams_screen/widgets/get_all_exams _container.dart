import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/start_exam_widget/start_exam_screen.dart';
import '../../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../data/mdoel/response/gel_all_exams_model/Exams.dart';

class GetAllExamsContainer extends StatelessWidget {
  final Exams exams;
  final String subjectIcon;
  GetAllExamsContainer({required this.exams, required this.subjectIcon,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StartExamScreen(
                      examId: exams.id.toString(),
                      examName: exams.title.toString(),
                      duration: exams.duration.toString(),
                      minutes: exams.duration.toString(),
                      noOfQuestions: exams.numberOfQuestions.toString(),
                  subjectIcon: subjectIcon.toString(),
                    )));
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
                child: Image.network(subjectIcon),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exams.title ?? "",
                            style: AppFonts.font16BlueWeight500.copyWith(
                                color: AppColors.kBlack,
                                decoration: TextDecoration.none),
                          ),
                          Text("${exams.duration} Minutes",
                              style: AppFonts.font13BlackWeight400.copyWith(
                                color: AppColors.kBlue,
                                decoration: TextDecoration.none,
                              )),
                        ],
                      ),
                      Text("${exams.numberOfQuestions} Question",
                          style: AppFonts.font13BlackWeight400.copyWith(
                            decoration: TextDecoration.none,
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("From 1.00  To 6.00",
                          style: AppFonts.font13BlackWeight400.copyWith(
                            decoration: TextDecoration.none,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
