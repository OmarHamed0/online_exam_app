import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/base/base_view.dart';
import 'package:online_exam/core/utils/functions/dialogs/app_dialogs.dart';
import 'package:online_exam/dependency_injection/di.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile_events.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/profile/widget/profile_form_widget.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile_cubit.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends BaseView<ProfileWidget, ProfileCubit> {
  bool isFlag = true;
  @override
  void initState() {
    super.initState();
    viewModel.doAction(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
        child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) =>_handleProfileBlocList(context,state),
         builder: (context, state) {
            return Scaffold(
             appBar: _buildProfileAppBar(context),
             body: state is GetProfileDataLoadingState ?
                   const Center(child: CircularProgressIndicator())
                  :state is GetProfileDataErrorState ?
                  const ProfileFormWidget() :
                    const ProfileFormWidget()

            );
        }),

    );
  }

  @override
  ProfileCubit initViewModel() {
    return getIt.get<ProfileCubit>();
  }
  AppBar _buildProfileAppBar(BuildContext context) {
    return AppBar(
      title: Text(viewModel.isFormValid ?
         viewModel.appLocalizations!.profile : viewModel.appLocalizations!.update
      ),
      leading:!viewModel.isFormValid
          ? IconButton(
        onPressed: () {
          viewModel.resetForm();
          viewModel.updateValidationState(true);
          viewModel.doAction(GetProfileDataEvent());
           },
        icon: const Icon(Icons.arrow_back_ios),
      )
          : null,
    );
  }
  dynamic _handleProfileBlocList(BuildContext context , ProfileState state){
    if(state is UpdateProfileDataSuccessState){
      Navigator.pop(context);
      viewModel.doAction(
          GetProfileDataEvent()
      );}
    else if(state is UpdateProfileDataLoadingState){
      AppDialogs.showLoading(context: context);
    }
    else if(state is UpdateProfileDataErrorState){
      Navigator.pop(context);
      AppDialogs.showErrorDialog(
          context: context,errorMassage: state.errorMassage);
    }
  }
}
