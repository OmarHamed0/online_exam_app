import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/presentation/widget/submit_button_widget.dart';
import '../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations!.resetPassword),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            CustomTextFromField(
              labelText: appLocalizations!.currentPassword,
              controller: TextEditingController(),
              validator: MyValidators.validatePassword,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 24.h,),
            CustomTextFromField(
              labelText: appLocalizations.newPassword,
              controller: TextEditingController(),
              validator: MyValidators.validatePassword,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 24.h,),
            CustomTextFromField(
              labelText: appLocalizations.confirmPassword,
              controller: TextEditingController(),
              validator: (value) =>
                  MyValidators.validatePasswordConfirmation(
                      confirmPassword: value, password: value),
              inputType: TextInputType.text,
            ),
            SizedBox(height: 24.h,),
            SubmitButtonWidget(text: appLocalizations.update,
                cheekBackGroundColor: false)
          ],
        ),
      ),
    );
  }
}
