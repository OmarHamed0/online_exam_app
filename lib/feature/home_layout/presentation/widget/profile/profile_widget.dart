import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/base/base_view.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile/profile_cubit.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/profile/widget/profile_form_field_widget.dart';

import '../../../../../core/styles/images/app_images.dart';
import '../../../../../core/utils/functions/dialogs/app_dialogs.dart';
import '../../../../../dependency_injection/di.dart';
import '../../view_model/profile/profile/profile_event.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseView<ProfileView,ProfileCubit> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doAction(GetUserInfoEvent()),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) => _handleStateChanges(context, state),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.titleAppBar()),
              leading: viewModel.isFormField==false
                  ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  viewModel.doAction(ChangeFormFieldEvent(isFormField: true));
                    viewModel.doAction(ResetFormFieldEvent());
                    viewModel.doAction(GetUserInfoEvent());
                },
              )
                  : null,
            ),
            body: _buildProfileViewBody(state),
          );
        },
      ),
    );
  }

  void _handleStateChanges(BuildContext context, ProfileState state) {
    if (state is EditUserLoadingState || state is GetUserInfoLoadingState) {
      AppDialogs.showHideDialog(context);
      AppDialogs.showLoading(context: context);
    } else if (state is EditUserErrorState) {
      AppDialogs.showHideDialog(context);
      AppDialogs.showErrorDialog(
          context: context,
          errorMassage: state.errorHandler ?? "Unknown error");
    } else if (state is EditUserSuccessState) {
      AppDialogs.showHideDialog(context);
      // AppDialogs.showToast(
      //   massage: "Edit Successful",
      // );
      viewModel.doAction(GetUserInfoEvent());
    }
  }

  Widget _buildProfileViewBody(ProfileState state) {
    
   if (state is GetUserInfoErrorState) {
      AppDialogs.showHideDialog(context);
      return Center(child: Lottie.asset(AppImages.loading));
   }
   else if(state is GetUserInfoLoadingState){
     AppDialogs.showHideDialog(context);
     return Center(child: Lottie.asset(AppImages.loading));
   }
   else {
     AppDialogs.showHideDialog(context);
     viewModel
         .doAction(PopularFormFieldEvent(userEntity:viewModel.appUserEntity!));
     return _buildSuccessState();
    }
  }

  Widget _buildSuccessState() {
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: const ProfileFormFieldWidget(),
        ));
  }

  @override
  initViewModel() {
   return getIt.get<ProfileCubit>();
  }
}
