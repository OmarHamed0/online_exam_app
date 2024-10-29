import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_cubite.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_state.dart';
import 'dart:async';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/fonts/app_fonts.dart';
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


  QuestionsScreen(
      {required this.examId,
      required this.examName,
      required this.duration,
   });
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<CheckQuestionAnswer>cheekQuestionAnswer=[];
  int selectedOption = -1;
  List<Questions> questionList = [];
  List<int?> selectedOptions = [];
  int currentQuestionIndex = 0;
  late int remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingTime = int.parse(widget.duration) * 60;
    startTimer();
    viewModel.getAllQuestions(widget.examId);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
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
                            Text(
                              'Time out !!',
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
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 50.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r)),
                            backgroundColor: AppColors.kBlue,
                            side: BorderSide(color: AppColors.kBlue),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         ExamScoreScreen(
                            //           correctAnswers: results['correctAnswers'],
                            //           wrongAnswers: results['wrongAnswers'],
                            //           scorePercentage: results['scorePercentage'],
                            //         ),
                            //   ),
                            // );

                          },
                          child: Text(
                            "View Score",
                            style: TextStyle(
                                color: AppColors.kWhite,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          );
        }
      });
    });
  }

  var viewModel = getIt.get<GetAllQuestionsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is GetAllQuestionsLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
                color: AppColors.kBlue,
              ));
        } else if (state is GetAllQuestionsSuccessState) {
          questionList = state.getAllQuestions?.questions ?? [];
          if (questionList.isEmpty) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColors.kWhite,
              child: Center(
                child: Text(
                  "No Questions Available.",
                  style: AppFonts.font20BlackWeight500,
                ),
              ),
            );
          }
          if (selectedOptions.length != questionList.length) {
            selectedOptions =
                List.filled(questionList.length, null);
          }

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
                        Text(
                          "${(remainingTime ~/ 60).toString().padLeft(
                              2, '0')}:${(remainingTime % 60)
                              .toString()
                              .padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: remainingTime < 10
                                ? AppColors.kRed
                                : AppColors.kGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: Column(children: [
                Text("Question ${currentQuestionIndex + 1} of $totalQuestions"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) / totalQuestions,
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
                          questionList[currentQuestionIndex].question ?? "",
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
                    itemCount:
                    questionList[currentQuestionIndex].answers?.length ?? 0,
                    itemBuilder: (context, index) {
                      return option(
                        index,
                        questionList[currentQuestionIndex]
                            .answers![index]
                            .answer ??
                            "",
                        currentQuestionIndex, // Pass the current question index
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: AppColors.kBlue),
                          ),
                          onPressed: currentQuestionIndex > 0
                              ? () {
                            setState(() {
                              currentQuestionIndex--;
                              selectedOption = -1;
                            });
                          }
                              : null,
                          child: Text(
                            "Back",
                            style: TextStyle(color: AppColors.kBlue),
                          ),
                        ),
                      ),
                    ),


                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.r)),
                            backgroundColor: AppColors.kBlue,
                            side: const BorderSide(color: AppColors.kBlue),
                          ),
                          onPressed: () {
                            if (currentQuestionIndex < totalQuestions - 1) {
                              setState(() {
                                currentQuestionIndex++;
                                selectedOption = -1;
                              });

                             cheekQuestionAnswer.add(CheckQuestionAnswer(
                               questionId:viewModel.questionsList[currentQuestionIndex].id ,
                               correct:correct ?? "A1"
                             ));


                            } else {
                              timer?.cancel();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ExamScoreScreen(
                                       quesion: cheekQuestionAnswer,
                                        ),
                                  ));
                            }
                          },
                          child: Text(
                            currentQuestionIndex < totalQuestions - 1
                                ? "Next"
                                : "Finish Exam",
                            style: TextStyle(color: AppColors.kWhite),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]));
        } else if (state is GetAllQuestionsErrorState) {
          return Center(
            child: Text("Error loading questions: ${state.exception}"),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  String ?  correct ;
  Widget option(int value, String text, int questionIndex) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            print(questionList[questionIndex].answers?[value].key.toString());
            correct =questionList[questionIndex].answers?[value].key.toString();
            selectedOptions[questionIndex] = value;
          });
        },
        child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: selectedOptions[questionIndex] == value
                ? AppColors.kMedBlue
                : AppColors.kLightBlue,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              Radio<int>(
                value: value,
                groupValue: selectedOptions[questionIndex],
                activeColor: AppColors.kBlue,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedOptions[questionIndex] = newValue;
                  });
                },
              ),
              Expanded(
                child: Text(text, style: AppFonts.font14BlackWeight400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(){
    for (var element in cheekQuestionAnswer) {
      print(element.questionId);
      print(element.correct);
    }
  }



}
