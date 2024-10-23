import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/widget/submit_button_widget.dart';
import '../../../view_model/profile/profile_cubit.dart';
import '../../../view_model/profile/profile_events.dart';

class UpdateProfileButtonWidget extends StatelessWidget {
  const UpdateProfileButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel=context.read<ProfileCubit>();
    return    BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SubmitButtonWidget(
          text: viewModel.appLocalizations!.update,
          cheekBackGroundColor: !viewModel.isFormValid,
          onPressed: () {
            if (viewModel.formKey.currentState!.validate()) {
              viewModel.updateValidationState(true);
              viewModel.doAction(UpdateProfileDataEvent());
            }
          },
        );
      },
    );

  }
}
