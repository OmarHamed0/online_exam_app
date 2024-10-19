import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/presentation/login/view_model/login_cubit.dart';
import 'package:online_exam/feature/auth/presentation/login/view_model/login_event.dart';
import 'package:online_exam/feature/auth/presentation/login/widget/remember_me_and_forget_password_row/remember_me_and_forget_password_row.dart';
import 'package:online_exam/feature/auth/presentation/login/widget/remember_me_and_forget_password_row/remember_me_widget.dart';
import 'package:online_exam/feature/auth/presentation/login/widget/submit_login_widget.dart';
import 'package:online_exam/feature/auth/presentation/widget/submit_button_widget.dart';
import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../widget/prom_pto_widet.dart';

class LoginFormFieldWidget extends StatelessWidget {
  const LoginFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginCubit>();
    return Form(
      key: loginViewModel.formKey,
      onChanged: () => loginViewModel.doAction(UpdateValidationEvent()),
      child: Column(
        children: [
          CustomTextFromField(
            inputType: TextInputType.emailAddress,
            labelText: loginViewModel.appLocalizations!.email,
            hintText: loginViewModel.appLocalizations!.enterEmail,
            controller: loginViewModel.email,
            validator: (value) => MyValidators.validateEmail(value),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextFromField(
            inputType: TextInputType.text,
            labelText: loginViewModel.appLocalizations!.password,
            hintText: loginViewModel.appLocalizations!.enterPassword,
            controller: loginViewModel.password,
            validator: (value) => MyValidators.validatePassword(value),
          ),
          SizedBox(
            height: 16.h,
          ),
          const RememberMeAndForgetPasswordRow(),
          SizedBox(
            height: 48.h,
          ),
          const SubmitLoginWidget(),
          SizedBox(
            height: 16.h,
          ),
          PromPtoWidget(
            text: loginViewModel.appLocalizations!.dontHaveAnAccount,
            textButton: loginViewModel.appLocalizations!.signUp,
            onPressed: () => _goNextToRegisterScreen(context)
          ),


        ],
      ),
    );
  }
  void _goNextToRegisterScreen(BuildContext context){
    Navigator.pushNamed(context, PageRouteName.register);
  }
}

