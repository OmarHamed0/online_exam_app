import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/utils/functions/dialogs/app_dialogs.dart';
import 'package:online_exam/feature/auth/presentation/login/view_model/login_cubit.dart';
import '../../../../../core/base/base_view.dart';
import '../../../../../dependency_injection/di.dart';
import '../widget/login_form_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseView<LoginView, LoginCubit> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<LoginCubit>(
        create: (context) => viewModel,
        child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              _handleBlocListener(state);
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text(viewModel.appLocalizations!.login),
                ),
                body: SingleChildScrollView(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: const Center(
                    child: LoginFormFieldWidget(),
                  ),
                )))));
  }

  @override
  LoginCubit initViewModel() {
    return getIt.get<LoginCubit>();
  }

  dynamic _handleBlocListener(LoginState loginStata) {
    {
      switch (loginStata) {
        case LoginLoadingStata():
          AppDialogs.showLoading(context: context);
        case LoginSuccessStata():
          Navigator.pop(context);
          goToNextHomeScreen();
        case LoginErrorStata():
          Navigator.pop(context);
          AppDialogs.showErrorDialog(
              context: context, errorMassage: loginStata.errorMassage ?? "");
        default:
          return;
      }
    }
  }

  goToNextHomeScreen() {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteName.mainHome,
      (route) => false,
    );
  }
}
