import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/feature/home_layout/view/view_model/home_layout_cubit.dart';
import 'package:online_exam/feature/home_layout/view/view_model/home_layout_states.dart';
import 'package:online_exam/feature/home_layout/view/widget/custom_bottom_navigation_bar.dart';

import '../../../dependency_injection/di.dart';
class MainHomeScreen extends StatelessWidget {
  static String routeName = "MainHomeScreen";
  var viewModel = getIt.get<MainHomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainHomeCubit, MainHomeStates>(
        bloc: viewModel,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: CustomBottomNavigationBar(
                  selectedIndex: viewModel.selectedIndex,
                  context: context,
                  onTabFunction: (index) {
                    viewModel.changeBottomNavigationBar(index);
                  }),
              body: viewModel.tabs[viewModel.selectedIndex]);
        });
  }
}