import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';

import '../../../../../core/base/base_view.dart';

import '../../../../../core/utils/functions/dialogs/app_dialogs.dart';
import '../../../../../dependency_injection/di.dart';
import '../view_model/register/register_cubit.dart';

import '../view_model/register/register_event.dart';
import '../widget/register_form_field_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseView<RegisterView, RegisterCubit> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<RegisterCubit>(
      create: (context) => viewModel,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) => _handleBlocListener(state),
        child: Scaffold(
          appBar: AppBar(title: Text(viewModel.appLocalizations!.signUp),),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: const RegisterFormFieldWidget(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  RegisterCubit initViewModel() {
    return getIt.get<RegisterCubit>();
  }

  dynamic _handleBlocListener(RegisterState registerState) {
    {
      switch (registerState) {
        case RegisterLoadingStata():
          AppDialogs.showLoading(context: context);
        case RegisterSuccessStata():
          Navigator.pop(context);
           goToNextLogin();
        case RegisterErrorStata():
          Navigator.pop(context);
          AppDialogs.showErrorDialog(context: context,errorMassage:  registerState.errorMassage ?? "");
        default:
          return;
      }
    }
  }

  goToNextLogin(){
    return Navigator.pushNamedAndRemoveUntil(context,
        PageRouteName.login, (route) => false,);
  }
}
