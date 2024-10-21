import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../../dependency_injection/di.dart';
import '../view_model/forget_password_cubit.dart';
import '../widget/email_verification_widget/email_verification_widget.dart';
import '../widget/forget_password_widget/forget_password_widget.dart';
import '../widget/reset_password_widget/reset_password_widget.dart';
class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState
    extends BaseView<ForgetPasswordView, ForgetPasswordCubit> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(viewModel.appLocalizations!.forgetPassword),),

       body:  Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: viewModel.pageController,
        reverse: true,
        scrollDirection: Axis.horizontal,
        padEnds: true,
        children: const [
          ForgetPasswordWidget(),
          EmailVerificationWidget(),
          ResetPasswordWidget(),
        ],
      ),
    )),
    );
  }

  @override
  ForgetPasswordCubit initViewModel() {
    return getIt.get<ForgetPasswordCubit>();
  }
}
