import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../data/mdoel/response/subject_model/subjects.dart';
class ExploreContainer extends StatelessWidget {
  Subjects subjects;
  ExploreContainer({required this.subjects});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
          context,
          PageRouteName.getAllExamsScreen,
          arguments: subjects,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(subjects.icon??""),
                SizedBox(
                  width: 10.w,
                ),
                Text(subjects.name??"",

                  style: AppFonts.font16GrayWeight400
                      .copyWith(color: AppColors.kBlack),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}