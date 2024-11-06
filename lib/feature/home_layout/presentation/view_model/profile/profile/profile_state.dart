part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

class GetUserInfoLoadingState extends ProfileState {}

class GetUserInfoSuccessState extends ProfileState {
  final AppUserEntity? userEntity;
  GetUserInfoSuccessState({this.userEntity});
}

class GetUserInfoErrorState extends ProfileState {
  final String? errorHandler;
  GetUserInfoErrorState({this.errorHandler});
}

class EditUserLoadingState extends ProfileState {}

class EditUserSuccessState extends ProfileState {
  final AppUserEntity? userEntity;
  EditUserSuccessState({this.userEntity});
}

class EditUserErrorState extends ProfileState {
  final String? errorHandler;
  EditUserErrorState({this.errorHandler});
}

class ChangeFormFieldState extends ProfileState {

}


