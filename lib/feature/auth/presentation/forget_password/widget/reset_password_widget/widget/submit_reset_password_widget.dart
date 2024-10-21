import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/feature/auth/presentation/forget_password/view_model/forget_password_cubit.dart';

import '../../../../widget/submit_button_widget.dart';
import '../../../view_model/forget_password_event.dart';

class SubmitResetPasswordWidget extends StatelessWidget {
  const SubmitResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var resetPasswordCubit=context.read<ForgetPasswordCubit>();
    return BlocBuilder<ForgetPasswordCubit,ForgetPasswordState>(builder: (context, state){
     return SubmitButtonWidget(
        text: resetPasswordCubit.appLocalizations!.continues,
        onPressed: () =>resetPasswordCubit.doAction(ResetPasswordButtonPressedEvent()),
        cheekBackGroundColor: resetPasswordCubit.isValid,
      );

    },);
  }
}
