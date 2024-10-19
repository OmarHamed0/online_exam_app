import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/base/base_view.dart';
import 'package:online_exam/core/caching/token_manger.dart';
import 'package:online_exam/dependency_injection/di.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile_cubit.dart';

import '../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../../../../core/utils/widget/submit_button_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends BaseView<ProfileWidget, ProfileCubit> {
  bool isFlag = true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isFlag ? "Profile " : "Edit Profile"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              CustomTextFromField(
                inputType: TextInputType.name,
                labelText: viewModel.appLocalizations!.userName,
                hintText: viewModel.appLocalizations!.enterEmail,
                controller: TextEditingController(),
                validator: (value) =>
                    MyValidators.validateNotEmpty(value: value),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      inputType: TextInputType.name,
                      labelText: viewModel.appLocalizations!.firstName,
                      hintText: viewModel.appLocalizations!.enterFirstName,
                      controller: TextEditingController(),
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
                      labelText: viewModel.appLocalizations!.lastName,
                      hintText: viewModel.appLocalizations!.enterFirstName,
                      controller: TextEditingController(),
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
                labelText: viewModel.appLocalizations!.email,
                hintText: viewModel.appLocalizations!.enterEmail,
                controller: TextEditingController(),
                validator: (value) => MyValidators.validateEmail(value),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFromField(
                inputType: TextInputType.text,
                labelText: viewModel.appLocalizations!.password,
                hintText: viewModel.appLocalizations!.enterPassword,
                controller: TextEditingController(),
                validator: (value) => MyValidators.validatePassword(value),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFromField(
                inputType: TextInputType.text,
                labelText: viewModel.appLocalizations!.rePassword,
                hintText: viewModel.appLocalizations!.rePassword,
                controller: TextEditingController(),
                validator: (value) => MyValidators.validatePasswordConfirmation(
                  password: TextEditingController().text,
                  confirmPassword: TextEditingController().text,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFromField(
                  inputType: TextInputType.phone,
                  labelText: viewModel.appLocalizations!.phone,
                  hintText: viewModel.appLocalizations!.enterPhone,
                  controller: TextEditingController(),
                  validator: (value) =>
                      MyValidators.validatePhoneNumber(value)),
              SizedBox(
                height: 20.h,
              ),
              //  const SubmitRegisterWidget(),
              SizedBox(
                height: 5.h,
              ),
              SubmitButtonWidget(
                cheekBackGroundColor: isFlag,
                text: isFlag ? "Update" : "Edit Profile",
                onPressed: () {
                  isFlag = !isFlag;
                  setState(() {});
                  TokenManger.deleteToken().then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                      context,
                      PageRouteName.login,
                      (route) => false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileCubit initViewModel() {
    return getIt.get<ProfileCubit>();
    throw UnimplementedError();
  }
}
