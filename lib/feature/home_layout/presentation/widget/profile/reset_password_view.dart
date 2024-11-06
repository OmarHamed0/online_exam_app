// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/base/base_view.dart';
import 'package:online_exam/core/caching/token_manger.dart';
import 'package:online_exam/core/utils/widget/submit_button_widget.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/reset_password/reset_password_cubit.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../core/utils/functions/dialogs/app_dialogs.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../../../../dependency_injection/di.dart';
import '../../view_model/profile/reset_password/reset_password_event.dart';

class ResetPasswordView extends StatefulWidget {
 const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState
    extends BaseView<ResetPasswordView, ResetPasswordCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reset Password "),
          leading: IconButton(
            onPressed: () {
              AppDialogs.showHideDialog(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kBlack,
            ),
          ),
        ),
        body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) => _handleStatesChange(state, context),
          child: Padding(
            padding: EdgeInsets.all(18.0.r),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    CustomTextFromField(
                      hintText: "Current password",
                      labelText: "Current password",
                      controller: viewModel.oldPassword,
                      validator: (value) =>
                          MyValidators.validatePassword(value),
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextFromField(
                      hintText: "New password",
                      labelText: "New password",
                      controller: viewModel.password,
                      validator: (value) =>
                          MyValidators.validatePassword(value),
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextFromField(
                      hintText: "Confirm  password",
                      labelText: "Confirm  password",
                      controller: viewModel.rePassword,
                      validator: (value) =>
                          MyValidators.validatePasswordConfirmation(
                              password: viewModel.password.text,
                              confirmPassword: value),
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    SubmitButtonWidget(
                      text: "Update",
                      cheekBackGroundColor: false,
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          viewModel.doAction(GetResetPasswordEvent());
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  dynamic _handleStatesChange(
      ResetPasswordState resetPasswordState, BuildContext context) {
    if (resetPasswordState is ResetPasswordLoadingState) {
      AppDialogs.showLoading(context: context);
    } else if (resetPasswordState is ResetPasswordErrorState) {
      AppDialogs.showHideDialog(context);
      AppDialogs.showErrorDialog(
        context: context,
        errorMassage: resetPasswordState.errorHandler ?? "",
      );
    } else if (resetPasswordState is ResetPasswordSuccessState) {
      AppDialogs.showHideDialog(context);
      TokenManger.setToken(token: resetPasswordState.changePasswordEntity?.token ?? "");
      AppDialogs.showErrorDialog(
        context: context,
        errorMassage: resetPasswordState.changePasswordEntity?.massage  ?? "Success",
      );    }

  }

  @override
  ResetPasswordCubit initViewModel() {
    return getIt.get<ResetPasswordCubit>();
  }
}
