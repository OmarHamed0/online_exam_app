import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/submit_button_widget.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_event.dart';

class SubmitLoginWidget extends StatelessWidget {
  const SubmitLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return SubmitButtonWidget(
            onPressed: () => loginViewModel.doAction(LoginButtonPressedEvent()),
            text: loginViewModel.appLocalizations!.login,
            cheekBackGroundColor: loginViewModel.isValid);
      },
    );
  }
}
