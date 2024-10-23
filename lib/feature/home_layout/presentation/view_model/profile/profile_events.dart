import 'package:online_exam/feature/home_layout/data/mdoel/profile/profile_request.dart';
import 'package:online_exam/feature/home_layout/domain/entities/app_user_entity.dart';

sealed class ProfileEvents {}
class GetProfileDataEvent extends ProfileEvents{}
class UpdateProfileDataEvent extends ProfileEvents{
}


class PopulateProfileFieldsEvent extends ProfileEvents{
  final AppUserEntity ? appUserEntity;
  PopulateProfileFieldsEvent({this.appUserEntity});
}

// class UpdateValidationEvent extends ProfileEvents{}