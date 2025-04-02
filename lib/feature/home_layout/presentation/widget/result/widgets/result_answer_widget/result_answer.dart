import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/fonts/app_fonts.dart';

class ResultAnswerScreen extends StatelessWidget {
  static String routeName = "resultAnswerScreen";

  const ResultAnswerScreen({super.key});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Answers",
          style: AppFonts.font20BlackWeight500,
        ),
        leading: const Icon(Icons.arrow_back_ios_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 370.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kWhite.withOpacity(0.7),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        Border.all(color: AppColors.kLightWhite, width: 3.w)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 370.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kWhite.withOpacity(0.7),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        Border.all(color: AppColors.kLightWhite, width: 3.w)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 370.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kWhite.withOpacity(0.7),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        Border.all(color: AppColors.kLightWhite, width: 3.w)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
