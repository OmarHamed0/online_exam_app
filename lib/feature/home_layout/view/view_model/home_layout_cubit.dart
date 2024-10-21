import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../presentation/widget/explore/explore_widget.dart';
import '../../presentation/widget/profile/profile_widget.dart';
import '../../presentation/widget/result/result_widget.dart';
import 'home_layout_states.dart';

@injectable
class MainHomeCubit extends Cubit<MainHomeStates> {
  MainHomeCubit() : super(MainHomeInitialStates());
  int selectedIndex = 0;

  List<Widget> tabs = [
    ExploreScreen(),
    ResultWidget(),
    ProfileWidget(),
  ];
  void changeBottomNavigationBar(int newSelectedIndex) {
    MainHomeInitialStates();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }
}