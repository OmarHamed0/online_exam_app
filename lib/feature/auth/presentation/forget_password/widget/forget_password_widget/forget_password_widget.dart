import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../core/utils/Functions/validators/my_validators.dart';
import '../../../../../../core/utils/functions/dialogs/app_dialogs.dart';
import '../../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../view_model/forget_password_cubit.dart';
import '../../view_model/forget_password_event.dart';
import 'widget/submit_forget_password_widget.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    var forgetPasswordViewModel = context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) =>_handelStateChange(state),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            forgetPasswordViewModel.appLocalizations!.forgetPassword,
            style: AppFonts.font18BlackWeight600,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            textAlign: TextAlign.start,
            forgetPasswordViewModel.appLocalizations!.titleForgetPassword,
            style: AppFonts.font14GrayWeight400,
          ),
          SizedBox(
            height: 32.h,
          ),
          Form(
            key: forgetPasswordViewModel.formKey,
            onChanged: () => forgetPasswordViewModel.doAction(UpdateValidationEvent()),
            child: CustomTextFromField(
                inputType: TextInputType.emailAddress,
                controller: forgetPasswordViewModel.emailController,
                validator: (value) => MyValidators.validateEmail(value),
                hintText:  forgetPasswordViewModel.appLocalizations!.email,
                labelText:  forgetPasswordViewModel.appLocalizations!.enterEmail,),
          ),
          SizedBox(
            height: 48.h,
          ),
          const SubmitForgetPasswordWidget()
        ],
      ),
    );
  }

  dynamic _handelStateChange(ForgetPasswordState state) {
    if (state is ForgetPasswordSuccessStata) {
      Navigator.pop(context);
      BlocProvider.of<ForgetPasswordCubit>(context).pageController
          .nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut);
    } else if (state is ForgetPasswordErrorStata) {
      Navigator.pop(context);
      AppDialogs.showErrorDialog(
          context: context, errorMassage: state.errorMassage ?? "");
    } else if (state is ForgetPasswordLoadingStata) {
      AppDialogs.showLoading(
          context: context,);
    }
  }
}
