import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/utils/functions/dialogs/app_dialogs.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view_model/forget_password_event.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/widget/reset_password_widget/widget/submit_reset_password_widget.dart';
import '../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../view_model/forget_password_cubit.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var resetPasswordCubit = context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) => _handleStateChange(context, state),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              resetPasswordCubit.appLocalizations!.resetPassword,
              style: AppFonts.font18BlackWeight600,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              resetPasswordCubit.appLocalizations!.titleResetPassword,
              style: AppFonts.font14GrayWeight400,
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              height: 32.h,
            ),
            Form(
              key: resetPasswordCubit.passwordFormKey,
              onChanged: () =>
                  resetPasswordCubit.doAction(UpdateValidationEvent()),
              child: CustomTextFromField(
                inputType: TextInputType.text,
                controller: resetPasswordCubit.newPasswordController,
                hintText: resetPasswordCubit.appLocalizations!.enterNewPassword,
                labelText: resetPasswordCubit.appLocalizations!.newPassword,
                validator: (p0) => MyValidators.validatePassword(p0),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Form(
              key: resetPasswordCubit.confirmPasswordFormKey,
              onChanged: () =>
                  resetPasswordCubit.doAction(UpdateValidationEvent()),
              child: CustomTextFromField(
                inputType: TextInputType.text,
                controller: resetPasswordCubit.newPasswordController,
                hintText: resetPasswordCubit.appLocalizations!.confirmPassword,
                labelText: resetPasswordCubit.appLocalizations!.confirmPassword,
                validator: (p0) => MyValidators.validatePassword(p0),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            const SubmitResetPasswordWidget(),
          ],
        ),
      ),
    );
  }

  void _handleStateChange(BuildContext context, ForgetPasswordState state) {
    if (state is ResetPasswordSuccessStata) {
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageRouteName.login,
        (route) => false,
      );
    } else if (state is ResetPasswordErrorStata) {
      Navigator.pop(context);
      AppDialogs.showErrorDialog(
          context: context, errorMassage: state.errorMassage ?? "");
    } else if (state is ResetPasswordLoadingStata) {
      AppDialogs.showLoading(context: context);
    }
  }
}
