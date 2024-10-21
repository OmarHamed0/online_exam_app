import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/feature/auth/presentation/login/view_model/login_cubit.dart';

import '../../../../../../core/styles/fonts/app_fonts.dart';
import '../../view_model/login_event.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
                value: loginViewModel.isRememberMe,
                onChanged: (value) =>
                    loginViewModel.doAction(RememberMeButtonEvent())),
            Text(loginViewModel.appLocalizations!.rememberMe,
                style: AppFonts.font14BlackWeight400),
          ],
        );
      },
    );
  }
}
