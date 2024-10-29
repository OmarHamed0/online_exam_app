import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/start_exam_widget/start_exam_screen.dart';
import '../../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../data/mdoel/response/gel_all_exams_model/Exams.dart';

class GetAllExamsContainer extends StatelessWidget {
  final Exams exam;
  final String subjectIcon;
  GetAllExamsContainer({
    required this.exam,
    required this.subjectIcon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StartExamScreen(
                      examId: exam.id.toString(),
                      examName: exam.title.toString(),
                      duration: exam.duration.toString(),
                      minutes: exam.duration.toString(),
                      noOfQuestions: exam.numberOfQuestions.toString(),
                      subjectIcon: subjectIcon.toString(),
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.kBlack.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 71.h,
                  width: 60.w,
                  child: Image.network(
                    subjectIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exam.title ?? "",
                            style: AppFonts.font16BlueWeight500.copyWith(
                                color: AppColors.kBlack,
                                decoration: TextDecoration.none),
                          ),
                          Text("${exam.duration} Minutes",
                              style: AppFonts.font13BlackWeight400.copyWith(
                                color: AppColors.kBlue,
                                decoration: TextDecoration.none,
                              )),
                        ],
                      ),
                      Text("${exam.numberOfQuestions} Question",
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
