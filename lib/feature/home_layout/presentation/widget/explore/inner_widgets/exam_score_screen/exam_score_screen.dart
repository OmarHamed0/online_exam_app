
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/fonts/app_fonts.dart';
import 'package:online_exam/dependency_injection/di.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/CheckQuestionsRequesrt.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/check_questions_view_model/check_questions_states.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../view_model/explore/check_questions_view_model/check_questions_cubit.dart';

class ExamScoreScreen extends StatefulWidget {
  static String routeName = "ExamScoreScreen";
  List<CheckQuestionAnswer> question;

  ExamScoreScreen({
    required this.question,
  });

  @override
  State<ExamScoreScreen> createState() => _ExamScoreScreenState();
}

class _ExamScoreScreenState extends State<ExamScoreScreen> {
  var viewModel = getIt.get<CheckQuestionsCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel
        ..checkQuestions(CheckQuestionsRequest(answers: widget.question)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Exam Score",
            style: AppFonts.font20BlackWeight500,
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, PageRouteName.mainHome);
              }),
        ),
        body: BlocBuilder<CheckQuestionsCubit, CheckQuestionsStates>(
          builder: (context, state) {
            if (state is CheckQuestionsLoadingStat) {
              return CircularProgressIndicator(
                color: AppColors.kBlue,
              );
            } else if (state is CheckQuestionsErrorStat) {
              return CircularProgressIndicator(
                color: Colors.yellow,
              );
            } else if (state is CheckQuestionsSuccessStat) {
              return Column(
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
                          style: AppFonts.font20BlackWeight500
                              .copyWith(fontSize: 18.sp),
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
                          curve: Curves.easeInOut,
                          backgroundColor: AppColors.kRed,
                          percent: double.parse(state.checkQuestions!.total!
                                  .replaceAll("%", "")) /
                              100,
                          progressColor: AppColors.kBlue,
                          center: Text(
                            "${state.checkQuestions!.total!.replaceAll("%", "")}%",
                            // "${(double.parse(state.checkQuestions!.total!.replaceAll('%', ''))).toStringAsFixed(0)}%",
                            style: AppFonts.font20BlackWeight500,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Correct",
                                        style: AppFonts.font16BlueWeight500
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.none)),
                                    Text(
                                      "${state.checkQuestions?.correct} ",
                                      style:
                                          AppFonts.font16BlueWeight500.copyWith(
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Wrong",
                                        style: AppFonts.font16BlueWeight500
                                            .copyWith(
                                                decoration: TextDecoration.none,
                                                color: AppColors.kRed)),
                                    Text("${state.checkQuestions?.wrong} ",
                                        style: AppFonts.font16BlueWeight500
                                            .copyWith(
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
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 120.w),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r)),
                      backgroundColor: AppColors.kBlue,
                      side: BorderSide(color: AppColors.kBlue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PageRouteName.resultScreen);
                    },
                    child: Text(
                      "Show Results",
                      style: TextStyle(
                          color: AppColors.kWhite, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 130.w, vertical: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      backgroundColor: AppColors.kWhite,
                      side: BorderSide(color: AppColors.kBlue, width: 1.w),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, PageRouteName.mainHome);
                    },
                    child: Text(
                      "Start again",
                      style: TextStyle(
                          color: AppColors.kBlue, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
