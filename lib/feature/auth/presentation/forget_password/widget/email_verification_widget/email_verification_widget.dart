import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view_model/forget_password_cubit.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view_model/forget_password_event.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/widget/email_verification_widget/widget/pin_code_field_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/styles/fonts/app_fonts.dart';
import '../../../../../../core/utils/functions/dialogs/app_dialogs.dart';
import '../../../widget/prom_pto_widet.dart';

class EmailVerificationWidget extends StatefulWidget {
  const EmailVerificationWidget({super.key});

  @override
  State<EmailVerificationWidget> createState() =>
      _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    var forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) => _handelStateChange(state),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            forgetPasswordCubit.appLocalizations!.emailVerification,
            style: AppFonts.font18BlackWeight600,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            forgetPasswordCubit.appLocalizations!.titleEmailVerification,
            style: AppFonts.font14GrayWeight400,
          ),
          SizedBox(
            height: 32.h,
          ),
          const PinCodeFieldWidget(),
          SizedBox(
            height: 48.h,
          ),
          PromPtoWidget(
              text: forgetPasswordCubit.appLocalizations!.dontHaveAnAccount,
              textButton: forgetPasswordCubit.appLocalizations!.reset,
              onPressed: () => forgetPasswordCubit.doAction(ForgetPasswordButtonPressedEvent()))
        ],
      ),
    );
  }

  dynamic _handelStateChange(ForgetPasswordState state) {
    if (state is EmailVerifyCodeSuccessStata) {
      Navigator.pop(context);
      BlocProvider.of<ForgetPasswordCubit>(context).pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut);
    } else if (state is EmailVerifyCodeErrorStata) {
      Navigator.pop(context);
      AppDialogs.showErrorDialog(
          context: context, errorMassage: state.errorMassage ?? "");
    } else if (state is EmailVerifyCodeLoadingStata) {
      AppDialogs.showLoading(context: context);
    }
  }
}
