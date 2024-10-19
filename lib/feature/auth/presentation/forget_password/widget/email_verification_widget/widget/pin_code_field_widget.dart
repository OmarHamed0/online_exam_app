import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view_model/forget_password_cubit.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view_model/forget_password_event.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFieldWidget extends StatelessWidget {
  const PinCodeFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        disabledColor: Colors.grey,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        selectedColor: Colors.red,
        fieldHeight: 74.h,
        fieldWidth: 50.w,
        errorBorderColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Colors.red,
        inactiveColor: Colors.red,
        selectedFillColor: Colors.white,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<ForgetPasswordCubit>(context)
              .doAction(VerifyResetCodedButtonPressedEvent(resetCode: value));
        }
      },
      keyboardType: TextInputType.phone,
      enabled: true,
      appContext: context,
    );
  }
}
