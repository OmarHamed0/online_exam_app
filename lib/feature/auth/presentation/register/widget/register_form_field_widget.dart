import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/feature/auth/presentation/register/view_model/register/register_cubit.dart';
import 'package:online_exam/feature/auth/presentation/register/view_model/register/register_event.dart';

import '../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../widget/prom_pto_widet.dart';
import 'submit_register_widget.dart';

class RegisterFormFieldWidget extends StatelessWidget {
  const RegisterFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel = context.read<RegisterCubit>();
    return Form(
      key: registerViewModel.formKey,
      onChanged: () => registerViewModel.doAction(UpdateValidationEvent()),
      child: Column(
        children: [
          CustomTextFromField(
            inputType: TextInputType.name,
            labelText: registerViewModel.appLocalizations!.userName,
            hintText: registerViewModel.appLocalizations!.enterEmail,
            controller: registerViewModel.userNameController,
            validator: (value) => MyValidators.validateNotEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFromField(
                  inputType: TextInputType.name,
                  labelText: registerViewModel.appLocalizations!.firstName,
                  hintText: registerViewModel.appLocalizations!.enterFirstName,
                  controller: registerViewModel.firstNameController,
                  validator: (value) =>
                      MyValidators.validateNotEmpty(value: value),
                ),
              ),
              SizedBox(
                width: 16.h,
              ),
              Expanded(
                child: CustomTextFromField(
                  inputType: TextInputType.name,
                  labelText: registerViewModel.appLocalizations!.lastName,
                  hintText: registerViewModel.appLocalizations!.enterFirstName,
                  controller: registerViewModel.lastNameController,
                  validator: (value) =>
                      MyValidators.validateNotEmpty(value: value),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextFromField(
            inputType: TextInputType.emailAddress,
            labelText: registerViewModel.appLocalizations!.email,
            hintText: registerViewModel.appLocalizations!.enterEmail,
            controller: registerViewModel.emailController,
            validator: (value) => MyValidators.validateEmail(value),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextFromField(
            inputType: TextInputType.text,
            labelText: registerViewModel.appLocalizations!.password,
            hintText: registerViewModel.appLocalizations!.enterPassword,
            controller: registerViewModel.passwordController,
            validator: (value) => MyValidators.validatePassword(value),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextFromField(
            inputType: TextInputType.text,
            labelText: registerViewModel.appLocalizations!.rePassword,
            hintText: registerViewModel.appLocalizations!.rePassword,
            controller: registerViewModel.rePasswordController,
            validator: (value) => MyValidators.validatePasswordConfirmation(
                password: registerViewModel.passwordController.text,
                confirmPassword: registerViewModel.rePasswordController.text),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextFromField(
              inputType: TextInputType.phone,
              labelText: registerViewModel.appLocalizations!.phone,
              hintText: registerViewModel.appLocalizations!.enterPhone,
              controller: registerViewModel.phoneController,
              validator: (value) => MyValidators.validatePhoneNumber(value)),
          SizedBox(
            height: 20.h,
          ),
          const SubmitRegisterWidget(),
          SizedBox(
            height: 5.h,
          ),
          PromPtoWidget(
            text: registerViewModel.appLocalizations!.dontHaveAnAccount,
            textButton: registerViewModel.appLocalizations!.signUp,
            onPressed: () =>Navigator.pushNamedAndRemoveUntil(context, PageRouteName.login,(route) => false,)
          ),
        ],
      ),
    );
  }
}
