import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/feature/auth/presentation/register/view_model/register/register_cubit.dart';

import '../../widget/submit_button_widget.dart';
import '../view_model/register/register_event.dart';

class SubmitRegisterWidget extends StatelessWidget {
  const SubmitRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return SubmitButtonWidget(
          text: registerViewModel.appLocalizations!.signUp,
          cheekBackGroundColor: registerViewModel.isValid,
          onPressed: () =>
              registerViewModel.doAction(RegisterButtonPressedEvent()));
    });
  }
}
