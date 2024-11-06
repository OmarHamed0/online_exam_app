import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base/base_view_model.dart';
import 'package:online_exam/feature/home_layout/domain/entities/app_user_entity.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile/profile_event.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../data/mdoel/request/edit_user_info_request.dart';
import '../../../../domain/use_case/profile/edit_profile_use_case.dart';
import '../../../../domain/use_case/profile/get_user_info_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends BaseViewModel<ProfileState> {
  final GetUserInfoUseCase _getLoggedUseInfoUseCase;
  final EditProfileUseCase _editProfileUseCase;
  ProfileCubit(this._getLoggedUseInfoUseCase, this._editProfileUseCase)
      : super(ProfileInitialState());

  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> doAction(ProfileEvent profileEvent) async {
    switch (profileEvent) {
      case GetUserInfoEvent():
        await _getUserInfo();
      case PopularFormFieldEvent():
        return  _profilePopularFields(userEntity: profileEvent.userEntity);
      case ResetFormFieldEvent():
        return _resetFormField();
      case EditProfileEvent():
        return  await _editProfile();
      case ChangeFormFieldEvent():
        return changeFormField(profileEvent.isFormField);
    }
  }
  AppUserEntity ? appUserEntity;
  Future<void> _getUserInfo() async {
    emit(GetUserInfoLoadingState());
    var result = await _getLoggedUseInfoUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity>():
        appUserEntity=result.data;
        emit(GetUserInfoSuccessState(userEntity: result.data));
      case Fail<AppUserEntity>():
        emit(GetUserInfoErrorState(
            errorHandler: getErrorMassageFromException(result.exception)));
    }
  }

  Future<void> _editProfile() async {
    EditUserInfoRequest editUserInfoRequest = EditUserInfoRequest(
        lastName: lastNameController.text,
        firstName: firstNameController.text,
        email: emailController.text,
        username: userNameController.text,
        phone: phoneController.text);
    emit(EditUserLoadingState());
    var result = await _editProfileUseCase.invoke(editUserInfoRequest);
    switch (result) {
      case Success<AppUserEntity>():
        emit(EditUserSuccessState(userEntity: result.data));
      case Fail<AppUserEntity>():
        emit(EditUserErrorState(
            errorHandler: getErrorMassageFromException(result.exception)));
    }
  }

  void _resetFormField() {
    userNameController.text = "";
    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    phoneController.text = "";
    isFormField=true;
  }

  void _popularField(TextEditingController controller, String? value) {
    controller.text = controller.text.isEmpty ? value ?? "" : controller.text;
  }

  void _profilePopularFields({required AppUserEntity userEntity}) {
    _popularField(userNameController, userEntity.username);
    _popularField(firstNameController, userEntity.firstName);
    _popularField(lastNameController, userEntity.lastName);
    _popularField(emailController, userEntity.email);
    _popularField(phoneController, userEntity.phone);
  }

  bool isFormField = true;
  String titleAppBar() {
    if (isFormField) {
      return "Profile";
    } else {
      return "Update";
    }
  }

  void changeFormField(bool isValid){
    emit(ProfileInitialState());
    isFormField = isValid;
    emit(ChangeFormFieldState());
  }
}
