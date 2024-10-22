import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/functions/dialogs/app_dialogs.dart';
import 'dart:async';

import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../../core/styles/images/app_images.dart';
class QuestionsScreen extends StatefulWidget {
  static String routeName = "questionsScreen";
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int selectedOption = -1;
  List<Map<String, dynamic>> questionList = [
    {
      "question": "Select the correctly punctuated \n sentence 1.",
      "options": [
        "It's going to rain today.",
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today."
      ]
    },
    {
      "question": "Select the correctly punctuated \n sentence 2.",
      "options": [
        "It's going to rain today.2",
        "It's going to rain today.2",
        "It's going to rain today.2",
        "It's going to rain today.2",
      ]
    },
    {
      "question": "Select the correctly punctuated \n sentence 3.",
      "options": [
        "It's going to rain today.3",
        "It's going to rain today.3",
        "It's going to rain today.3",
        "It's going to rain today.3",
      ]
    },
    {
      "question": "Select the correctly punctuated \n sentence 4.",
      "options": [
        "It's going to rain today.4",
        "It's going to rain today.4",
        "It's going to rain today.4",
        "It's going to rain today.4",
      ]
    },
    {
      "question": "Select the correctly punctuated \n sentence 5.",
      "options": [
        "It's going to rain today.5",
        "It's going to rain today.5",
        "It's going to rain today.5",
        "It's going to rain today.5",
      ]
    },
  ];

  int currentQuestionIndex = 0;
  int remainingTime = 60;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
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
          AppDialogs.showTimedOut(context: context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalQuestions = questionList.length;

    return Scaffold(
        appBar: AppBar(
          title: Text("Exam"),
          leading: Icon(Icons.arrow_back_ios_rounded),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(AppImages.alarm),
                  SizedBox(width: 5),
                  Text("00:${remainingTime.toString().padLeft(2, '0')}",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        color: remainingTime < 10 ? AppColors.kRed : AppColors.kGreen,)),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(questionList[currentQuestionIndex]['question'],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kBlack,
                        fontSize: 18.sp,
                        overflow: TextOverflow.ellipsis)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questionList[currentQuestionIndex]['options'].length,
              itemBuilder: (context, index) {
                return option(index,
                    questionList[currentQuestionIndex]['options'][index]);
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
                      side: BorderSide(color: AppColors.kBlue),
                    ),
                    onPressed: currentQuestionIndex < totalQuestions - 1
                        ? () {
                            setState(() {
                              currentQuestionIndex++;
                              selectedOption = -1;
                            });
                          }
                        : null,
                    child: Text(
                      "Next",
                      style: TextStyle(color: AppColors.kWhite),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]));
  }

  Widget option(int value, String text) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedOption = value;
          });
        },
        child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: selectedOption == value
                ? AppColors.kMedBlue
                : AppColors.kLightBlue,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              Radio<int>(
                value: value,
                groupValue: selectedOption,
                activeColor: AppColors.kBlue,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedOption = newValue!;
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
}
