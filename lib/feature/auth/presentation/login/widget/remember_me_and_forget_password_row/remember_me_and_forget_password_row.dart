import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/feature/auth/presentation/login/view_model/login_cubit.dart';
import 'package:online_exam/feature/auth/presentation/login/widget/remember_me_and_forget_password_row/remember_me_widget.dart';

import '../../../../../../core/styles/fonts/app_fonts.dart';

class RememberMeAndForgetPasswordRow extends StatelessWidget {
  const RememberMeAndForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RememberMeWidget(),
        const Spacer(),
        TextButton(
          onPressed: ()=>Navigator.pushNamed(context,PageRouteName.forgetPassword),
          child: Text(
              BlocProvider.of<LoginCubit>(context)
                  .appLocalizations!
                  .forgetPassword,
              textAlign: TextAlign.left,
              style: AppFonts.font13BlackWeight400),
        )
      ],
    );
  }
}
