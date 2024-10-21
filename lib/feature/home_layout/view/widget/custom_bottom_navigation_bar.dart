import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/app_colors.dart';

Widget CustomBottomNavigationBar(
    {required int selectedIndex,
      required BuildContext context,
      required Function(int) onTabFunction}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(20.r),
      topLeft: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.kBlue,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {
          onTabFunction(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
              selectedIndex == 0 ? AppColors.kBlue:AppColors.kGray,
              backgroundColor:
              selectedIndex == 0 ? Colors.transparent : Colors.transparent,
              radius: 15,
              child: Icon(
                Icons.home_outlined,
                size: 20.sp,
              ),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                foregroundColor:
                selectedIndex == 1 ? AppColors.kBlue: AppColors.kGray,
                backgroundColor: selectedIndex == 1
                    ? Colors.transparent
                    : Colors.transparent,
                radius: 15,
                child: Icon(
                  Icons.event_note,
                  size: 20.sp,
                ),
              ),
              label: "Result"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                foregroundColor:
                selectedIndex == 2 ? AppColors.kBlue : AppColors.kGray,
                backgroundColor: selectedIndex == 2
                    ? Colors.transparent
                    : Colors.transparent,
                radius: 15,
                child: Icon(
                  Icons.person_outline_outlined,
                  size: 20.sp,
                ),
              ),
              label: "Profile"),
        ]),
  );
}