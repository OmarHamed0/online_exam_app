part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
class GetProfileDataLoadingState extends ProfileState{}
class GetProfileDataSuccessState extends ProfileState{
  final AppUserEntity ?appUserEntity;
  GetProfileDataSuccessState({ this.appUserEntity});
}
class GetProfileDataErrorState extends ProfileState{
  final String errorMassage;
  GetProfileDataErrorState({required this.errorMassage});
}
