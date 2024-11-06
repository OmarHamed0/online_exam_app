import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/fonts/app_fonts.dart';
import 'package:online_exam/core/utils/functions/dialogs/app_dialogs.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_cubite.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_state.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/images/app_images.dart';
import '../../../../../../../dependency_injection/di.dart';
import '../../../../../data/mdoel/request/CheckQuestionsRequesrt.dart';
import '../../../../../data/mdoel/response/get_all_qeastions_model/Questions.dart';
import '../exam_score_screen/exam_score_screen.dart';

class QuestionsScreen extends StatefulWidget {
  static String routeName = "questionsScreen";
  final String examId;
  final String examName;
  final String duration;

  QuestionsScreen({
    required this.examId,
    required this.examName,
    required this.duration,
  });
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int selectedOption = -1;

  @override
  void initState() {
    super.initState();
    viewModel.getAllQuestions(widget.examId, int.parse(widget.duration));
  }

  @override
  void dispose() {
    viewModel.stopTimer();
    super.dispose();
  }

  var viewModel = getIt.get<GetAllQuestionsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is GetAllQuestionsLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.kBlue,
          ));
        } else if (state is GetAllQuestionsSuccessState) {
          return buildQuestionContent(context, state);
        } else if (state is GetAllQuestionsErrorState) {
          return Center(
              child: Text("Error loading questions: ${state.errorMassage}"));
        } else if (state is GetAllQuestionsTimeOutState) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AppDialogs.showTimeOutDialog(
              context: context,
              onPressedViewScore: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExamScoreScreen(
                              question: viewModel.cheekQuestionAnswer,
                            )));
              },
            );
          });

          return Container();
        } else if (state is GetAllQuestionsEmptyState) {
          return Scaffold(
            backgroundColor: AppColors.kWhite,
            body: Center(
              child: Text(
                "No questions available",
                style: AppFonts.font20BlackWeight500,
              ),
            ),
          );
        }
        return Center(child: Text("Unexpected state"));
      },
    );
  }

  Widget buildQuestionContent(
      BuildContext context, GetAllQuestionsSuccessState state) {
    List<Questions> questionList = viewModel.questionList;
    int totalQuestions = questionList.length;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.examName),
          leading: const Icon(Icons.arrow_back_ios_rounded),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(AppImages.alarm),
                  const SizedBox(width: 5),
                  BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsStates>(
                    bloc: viewModel,
                    builder: (context, state) {
                      int remainingTime = viewModel.remainingTime;
                      return Text(
                        "${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: remainingTime < 10
                              ? AppColors.kRed
                              : AppColors.kGreen,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(children: [
          Text(
              "Question ${viewModel.currentQuestionIndex + 1} of $totalQuestions"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: (viewModel.currentQuestionIndex + 1) / totalQuestions,
              backgroundColor: AppColors.kLightGrey,
              color: AppColors.kBlue,
              minHeight: 5,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    questionList[viewModel.currentQuestionIndex].question ?? "",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.kBlack,
                      fontSize: 18.sp,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questionList[viewModel.currentQuestionIndex]
                      .answers
                      ?.length ??
                  0,
              itemBuilder: (context, index) {
                return option(
                    index,
                    questionList[viewModel.currentQuestionIndex]
                            .answers![index]
                            .answer ??
                        "");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(),
                SizedBox(
                  width: 15.w,
                ),
                nextOrFinishButton(totalQuestions),
              ],
            ),
          ),
        ]));
  }

  Widget backButton() {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          backgroundColor: Colors.white,
          side: BorderSide(color: AppColors.kBlue),
        ),
        onPressed: viewModel.currentQuestionIndex > 0
            ? () {
                setState(() => viewModel.currentQuestionIndex--);
              }
            : null,
        child: Text(
          "Back",
          style: TextStyle(color: AppColors.kBlue),
        ),
      ),
    );
  }

  Widget nextOrFinishButton(int totalQuestions) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          backgroundColor: AppColors.kBlue,
          side: const BorderSide(color: AppColors.kBlue),
        ),
        onPressed: () {
          if (!viewModel.cheekQuestionAnswer.any((element) =>
              element.questionId ==
              viewModel.questionList[viewModel.currentQuestionIndex].id)) {
            viewModel.cheekQuestionAnswer.add(CheckQuestionAnswer(
              questionId:
                  viewModel.questionList[viewModel.currentQuestionIndex].id,
              correct: viewModel.selectedOptions[viewModel.currentQuestionIndex]
                      ?.toString() ??
                  "0",
            ));
          }

          if (viewModel.currentQuestionIndex < totalQuestions - 1) {
            viewModel.nextQuestion();
          } else {
            viewModel.stopTimer();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ExamScoreScreen(
                  question: viewModel.cheekQuestionAnswer,
                ),
              ),
            );
          }
        },
        child: Text(
          viewModel.currentQuestionIndex < totalQuestions - 1
              ? "Next"
              : "Finish Exam",
          style: TextStyle(color: AppColors.kWhite),
        ),
      ),
    );
  }

  String? correct;
  Widget option(int value, String text) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            correct = viewModel.questionList[viewModel.currentQuestionIndex]
                .answers?[value].key
                .toString();
            viewModel.selectOption(
                viewModel.currentQuestionIndex, value, correct ?? "0");
          },
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color:
                  viewModel.selectedOptions[viewModel.currentQuestionIndex] ==
                          value
                      ? AppColors.kMedBlue
                      : AppColors.kLightBlue,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Radio<int>(
                  value: value,
                  activeColor: AppColors.kBlue,
                  groupValue:
                      viewModel.selectedOptions[viewModel.currentQuestionIndex],
                  onChanged: (int? newValue) {
                    setState(() {
                      viewModel
                              .selectedOptions[viewModel.currentQuestionIndex] =
                          newValue;
                    });
                  },
                ),
                Expanded(child: Text(text)),
              ],
            ),
          ),
        ));
  }
}
