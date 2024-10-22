import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/result/widgets/result_screen/widgets/result_container.dart';

import '../../../../../../../core/styles/fonts/app_fonts.dart';

class ResultWidget extends StatelessWidget {
  static const String routeName = "ResultScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kBlack),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Language",
                  style: AppFonts.font18BlackWeight600
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.8,
                  ),
                  itemBuilder: (context, index) {
                    return ResultContainer();
                  })),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Language",
                  style: AppFonts.font18BlackWeight600
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return ResultContainer();
                  }))
        ],
      ),
    );
  }
}
