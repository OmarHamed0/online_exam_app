import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../../core/styles/fonts/app_fonts.dart';

class QuestionAnswerContainer extends StatefulWidget {
  final Map<String, dynamic> question;
  QuestionAnswerContainer({required this.question});
  @override
  State<QuestionAnswerContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionAnswerContainer> {
  int selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.question['question'],
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
              itemCount: widget.question['options'].length,
              itemBuilder: (context, index) {
                return option(index, widget.question['options'][index]);
              },
            ),
          ),
        ],
      ),
    );
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
                ? AppColors.kLightGreen
                : AppColors.kLightBlue,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              Radio<int>(
                value: value,
                groupValue: selectedOption,
                activeColor: AppColors.kGreen,
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
