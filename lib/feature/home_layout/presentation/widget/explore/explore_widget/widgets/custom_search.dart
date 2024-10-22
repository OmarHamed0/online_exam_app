import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: AppColors.kWhite,
        width: double.infinity,
        child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(0.8),
                hintText: "Search ",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kDarkGray.withOpacity(0.95),
                ),
                prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 28.sp,
                      color: AppColors.kDarkGray.withOpacity(0.75),
                    ),
                    onPressed: () {}),
                border: buildBaseBorder(),
                enabledBorder: buildBaseBorder(),
                focusedBorder: buildBaseBorder())),
      ),
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(color: AppColors.kGray, width: 1));
  }
}