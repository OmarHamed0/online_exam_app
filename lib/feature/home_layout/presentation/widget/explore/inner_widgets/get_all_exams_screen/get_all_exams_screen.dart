import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/dependency_injection/di.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_state.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/get_all_exams_screen/widgets/get_all_exams%20_container.dart';
import '../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';

class GetAllExamsScreen extends StatelessWidget {
  static String routeName = "specificSubjectScreen";
  final String subjectId;
  final String subjectName;
  GetAllExamsScreen({required this.subjectId, required this.subjectName});

  var viewModel = getIt.get<GetAllExamsCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getAllExams(subjectId),
      child: BlocBuilder<GetAllExamsCubit, GetAllExamsStates>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(subjectName,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.w600)),
            leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PageRouteName.mainHome);
                },
                child: Icon(Icons.arrow_back_ios_rounded)),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              state is GetAllExamsSuccessStat
                  ? viewModel.examsList.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                              itemCount: viewModel.examsList.length,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 2.8,
                              ),
                              itemBuilder: (context, index) {
                                return GetAllExamsContainer(
                                  exams: viewModel.examsList[index],
                                );
                              }))
                      : Center(
                          child: Text(
                            "No exams available For This Subject.",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.kGray,
                            ),
                          ),
                        )
                  : state is GetAllExamsLoadingStat
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kBlue,
                          ),
                        )
                      : state is GetAllExamsErrorStat
                          ? Center(
                              child: Text(
                                state.errorMessage?.toString() ??
                                    "An error occurred.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.kRed,
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
            ],
          ),
        );
      }),
    );
  }
}
