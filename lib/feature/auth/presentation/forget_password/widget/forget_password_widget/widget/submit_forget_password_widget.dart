import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/submit_button_widget.dart';
import '../../../view_model/forget_password_cubit.dart';
import '../../../view_model/forget_password_event.dart';

class SubmitForgetPasswordWidget extends StatelessWidget {
  const SubmitForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var  forgetPasswordViewModel=context.read<ForgetPasswordCubit>();
    return     BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return SubmitButtonWidget(
          cheekBackGroundColor: forgetPasswordViewModel.isValid,
          text: forgetPasswordViewModel.appLocalizations!.continues,
          onPressed: () => forgetPasswordViewModel.doAction(ForgetPasswordButtonPressedEvent()),
        );
      },
    );
  }
}
