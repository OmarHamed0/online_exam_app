
import '../../../../domain/entities/app_user_entity.dart';

sealed class ProfileEvent {}

class GetUserInfoEvent extends ProfileEvent{}
class EditProfileEvent extends ProfileEvent{}


class PopularFormFieldEvent extends ProfileEvent{
  final AppUserEntity userEntity;

  PopularFormFieldEvent({required this.userEntity});
}

class ResetFormFieldEvent extends ProfileEvent{}

class ChangeFormFieldEvent extends ProfileEvent{
 final bool isFormField;
  ChangeFormFieldEvent({required this.isFormField});
}



