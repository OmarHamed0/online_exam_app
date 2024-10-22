import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/dependency_injection/di.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_state.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/specific_subject_screen/widgets/get_all_exams%20_container.dart';
import '../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/fonts/app_fonts.dart';

class GetAllExamsScreen extends StatelessWidget {
  static String routeName = "specificSubjectScreen";
  var viewModel = getIt.get<GetAllExamsCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllExamsCubit, GetAllExamsStates>(
        bloc: viewModel..getAllExams(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Language",
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Subject Exams",
                        style: AppFonts.font18BlackWeight600
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                state is GetAllExamsSuccessStat
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
                    : CircularProgressIndicator(
                        color: AppColors.kWhite,
                      ),
              ],
            ),
          );
        });
  }
}
