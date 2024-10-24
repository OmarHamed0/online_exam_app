import 'package:flutter/material.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view/forget_password_view.dart';
import 'package:online_exam/feature/auth/presentation/register/view/register_view.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/exam_score_screen/exam_score_screen.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/start_exam_widget/start_exam_screen.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/result/widgets/result_answer_widget/result_answer.dart';
import 'package:online_exam/feature/splash/splash_view.dart';

import '../../feature/auth/presentation/login/view/login_view.dart';
import '../../feature/home_layout/presentation/widget/explore/inner_widgets/get_all_exams_screen/get_all_exams_screen.dart';
import '../../feature/home_layout/presentation/widget/explore/inner_widgets/question_screen/questions_screen.dart';
import '../../feature/home_layout/view/home_layout_view.dart';
class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handleMaterialPageRoute(widget: const SplashView());
      case PageRouteName.getAllExamsScreen:
        return _handleMaterialPageRoute(widget:  GetAllExamsScreen());
      case PageRouteName.login:
        return _handleMaterialPageRoute(widget: const LoginView());
      case PageRouteName.register:
        return _handleMaterialPageRoute(widget: const RegisterView());
      case PageRouteName.forgetPassword:
        return _handleMaterialPageRoute(widget: const ForgetPasswordView());
      case PageRouteName.mainHome:
        return _handleMaterialPageRoute(widget:  MainHomeScreen());
        case PageRouteName.startExamScreen:
        return _handleMaterialPageRoute(widget:  StartExamScreen());
      case PageRouteName.questionsScreen:
        return _handleMaterialPageRoute(widget: QuestionsScreen());
      case PageRouteName.examScoreScreen:
        return _handleMaterialPageRoute(widget: ExamScoreScreen());
        case PageRouteName.resultAnswerScreen:
        return _handleMaterialPageRoute(widget: ResultAnswerScreen());
      default:
        return _handleMaterialPageRoute(widget: const Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute(
      {required Widget widget}) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
