import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/base/base_view_model.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/user_model.dart';
import 'package:online_exam/feature/home_layout/domain/entities/app_user_entity.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/profile/get_profile_data_use_case.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/profile/update_profile_data_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile_events.dart';

import '../../../data/mdoel/profile/profile_request.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends BaseViewModel<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  final UpdateProfileDataUseCase _updateProfileDataUseCase;
  ProfileCubit(this._getProfileDataUseCase,this._updateProfileDataUseCase) : super(ProfileInitial());

  void doAction(ProfileEvents profileEvents) {
    switch (profileEvents) {
      case GetProfileDataEvent():
        _getProfileData();
      case UpdateProfileDataEvent():
        _updateProfileDate();
      case PopulateProfileFieldsEvent():
        _populateProfileFields(profileEvents.appUserEntity);
      // case UpdateValidationEvent():
      //     _updateValidationState();
    }
  }

  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void _populateField(TextEditingController controller, String? value) {
    controller.text = controller.text.isEmpty ?
       value ?? "" : controller.text;
  }

  void _populateProfileFields(AppUserEntity ? appUserEntity) {
    _populateField(userNameController, appUserEntity?.username);
    _populateField(firstNameController, appUserEntity?.firstName);
    _populateField(lastNameController, appUserEntity?.lastName);
    _populateField(emailController, appUserEntity?.email);
    _populateField(phoneController, appUserEntity?.phone);
  }
  void resetForm(){
    userNameController.text="";
    firstNameController.text="";
    lastNameController.text="";
    emailController.text="";
    phoneController.text="";
  }

  bool isFormValid=true;
   void updateValidationState(bool isValid){
     isFormValid=isValid;
     print(isFormValid);
       emit(UpdateValidationState());
   }



   AppUserEntity ? appUserEntity  ;

  void _getProfileData() async {
    emit(GetProfileDataLoadingState());
    var result = await _getProfileDataUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity?>():
        appUserEntity=result.data;
        emit(GetProfileDataSuccessState(appUserEntity: result.data));
      case Fail<AppUserEntity?>():
        emit(GetProfileDataErrorState(
            errorMassage: getErrorMassageFromException(result.exception)));
    }
  }


  Future<void> _updateProfileDate()
  async{

    emit(UpdateProfileDataLoadingState());
    ProfileRequest profileRequest=ProfileRequest(
      email: emailController.text,
      phone: phoneController.text,
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text
    );
    var result = await _updateProfileDataUseCase.invoke(
        profileRequest: profileRequest);
    switch (result) {
      case Success<AppUserEntity?>():
        emit(UpdateProfileDataSuccessState(appUserEntity: result.data));
      case Fail<AppUserEntity?>():
        emit(UpdateProfileDataErrorState(
            errorMassage: getErrorMassageFromException(result.exception)));
    }


  }
}
