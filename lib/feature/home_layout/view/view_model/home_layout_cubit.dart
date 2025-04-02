import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../presentation/widget/explore/explore_widget/explore_widget.dart';
import '../../presentation/widget/profile/profile_widget.dart';
import '../../presentation/widget/result/widgets/result_screen/result_widget.dart';
import 'home_layout_states.dart';

@injectable
class MainHomeCubit extends Cubit<MainHomeStates> {
  int selectedIndex = 0;
  MainHomeCubit() : super(MainHomeInitialStates());
  List<Widget> get tabs => [
    ExploreScreen(),
    const ResultScreen(),
    const ProfileView(),
  ];
  void changeBottomNavigationBar(int newSelectedIndex) {
    MainHomeInitialStates();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }
}