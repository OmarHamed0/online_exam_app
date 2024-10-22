import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/explore_widget/widgets/custom_search.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/explore_widget/widgets/explore_container.dart';
import '../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../dependency_injection/di.dart';
import '../../../view_model/explore/get_all_subjects_view_model/get_all_subjects_cubit.dart';
import '../../../view_model/explore/get_all_subjects_view_model/get_all_subjects_state.dart';

class ExploreScreen extends StatelessWidget {
  static  String routeName = "ExploreScreen";
  var viewModel = getIt.get<ExploreCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, GetAllSubjectsStates>(
        bloc: viewModel..getAllSubjects(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Survery",
                  style: AppFonts.font16BlueWeight500.copyWith(
                    decoration: TextDecoration.none,
                    fontSize: 20.sp,
                  )),
            ),
            body: Column(
              children: [
                CustomSearch(),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Browse by subject",
                        style: AppFonts.font18BlackWeight600
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                state is GetAllSubjectsSuccessState
                    ? Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.subjectList.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5,
                        childAspectRatio: 3.1,
                      ),
                      itemBuilder: (context, index) {
                        return ExploreContainer(
                            subjects: viewModel.subjectList[index]);
                      }),
                )
                    : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kBlue,
                  ),
                )
              ],
            ),
          );
        });
  }
}