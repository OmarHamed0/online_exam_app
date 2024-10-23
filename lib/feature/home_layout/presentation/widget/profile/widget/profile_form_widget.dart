import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/utils/widget/custom_text_form_field.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/profile/widget/update_profile_button_widget.dart';
import '../../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../view_model/profile/profile_events.dart';

class ProfileFormWidget extends StatelessWidget {
  const ProfileFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<ProfileCubit>();
    viewModel.doAction(
        PopulateProfileFieldsEvent(appUserEntity: viewModel.appUserEntity));
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Form(
          key: viewModel.formKey,
          onChanged: () {
            viewModel.updateValidationState(false);
          },
          child: Column(
            children: [
              CustomTextFromField(
                labelText: viewModel.appLocalizations!.userName,
                controller: viewModel.userNameController,
                validator: MyValidators.validateName,
                inputType: TextInputType.name,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      labelText: viewModel.appLocalizations!.firstName,
                      controller: viewModel.firstNameController,
                      validator: MyValidators.validateName,
                      inputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(width: 16.h),
                  Expanded(
                    child: CustomTextFromField(
                      labelText: viewModel.appLocalizations!.lastName,
                      controller: viewModel.lastNameController,
                      validator: MyValidators.validateName,
                      inputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                labelText: viewModel.appLocalizations!.email,
                controller: viewModel.emailController,
                validator: MyValidators.validateEmail,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                labelText: viewModel.appLocalizations!.password,
                controller: TextEditingController(text: "**********"),
                inputType: TextInputType.none,
                isObscureText: true,
                suffixIcon: TextButton(
                  onPressed: () {
                     Navigator.pushNamed(context, PageRouteName.resetPassword);
                  },
                  child: Text(viewModel.appLocalizations!.change),
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                labelText: viewModel.appLocalizations!.phone,
                controller: viewModel.phoneController,
                validator: MyValidators.validatePhoneNumber,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: 24.h),
              const UpdateProfileButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
