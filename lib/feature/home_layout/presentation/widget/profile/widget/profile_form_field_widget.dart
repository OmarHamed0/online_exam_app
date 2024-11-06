import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/routes/page_route_name.dart';
import '../../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../../../../../core/utils/widget/submit_button_widget.dart';
import '../../../view_model/profile/profile/profile_cubit.dart';
import '../../../view_model/profile/profile/profile_event.dart';


class ProfileFormFieldWidget extends StatefulWidget {
  const ProfileFormFieldWidget({super.key});

  @override
  State<ProfileFormFieldWidget> createState() => _ProfileFormFieldWidgetState();
}

class _ProfileFormFieldWidgetState extends State<ProfileFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    var profileViewModel = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Form(
            key: profileViewModel.formKey,
            onChanged: () {
              if (profileViewModel.isFormField) {
                profileViewModel.doAction(
                    ChangeFormFieldEvent(isFormField: false));
              }
            },
            child: Column(children: [
              CustomTextFromField(
                hintText: profileViewModel.userNameController.text,
                labelText: "user Name",
                controller: profileViewModel.userNameController,
                validator: (value) =>
                    MyValidators.validateNotEmpty(
                        value: value,
                        title: profileViewModel.userNameController.text),
                inputType: TextInputType.name,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      hintText: profileViewModel.firstNameController.text,
                      labelText: "First Name",
                      controller: profileViewModel.firstNameController,
                      validator: (value) =>
                          MyValidators.validateNotEmpty(value: value),
                      inputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(width: 16.h),
                  Expanded(
                    child: CustomTextFromField(
                      hintText: profileViewModel.lastNameController.text,
                      labelText: "First Name",
                      controller: profileViewModel.lastNameController,
                      validator: (value) =>
                          MyValidators.validateNotEmpty(value: value),
                      inputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                hintText: profileViewModel.emailController.text,
                labelText: "Email Address",
                controller: profileViewModel.emailController,
                validator: (value) => MyValidators.validateEmail(value),
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                labelText: "",
                hintText: "***********",
                controller: TextEditingController(text: "**********"),
                inputType: TextInputType.none,
                isObscureText: true,
                suffixIcon: TextButton(
                  onPressed: () => goNextToChangePassword(),
                  child: const Text("change"),
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                hintText: profileViewModel.phoneController.text,
                labelText: "Phone",
                controller: profileViewModel.phoneController,
                validator: (value) => MyValidators.validatePhoneNumber(value),
                inputType: TextInputType.phone,
              ),
              SizedBox(height: 24.h),
              SubmitButtonWidget(
                  cheekBackGroundColor: !profileViewModel.isFormField,
                  text: "Update",
                  onPressed: () => updatePasswordButton(profileViewModel)),
            ]));
      },
    );
  }

  void updatePasswordButton(ProfileCubit profileViewModel) {
    if (!profileViewModel.isFormField) {
      profileViewModel.doAction(ChangeFormFieldEvent(isFormField: true));
      if (profileViewModel.formKey.currentState!.validate()) {
        profileViewModel.doAction(EditProfileEvent()).then((value) {
          profileViewModel.doAction(GetUserInfoEvent());
          profileViewModel.doAction(ResetFormFieldEvent());
        });
      }
    }
  }

  void goNextToChangePassword() {
     Navigator.pushNamed(context, PageRouteName.resetPassword);
  }
}
