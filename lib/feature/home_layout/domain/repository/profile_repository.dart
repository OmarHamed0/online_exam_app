
import '../../../../core/api/api_result.dart';
import '../../data/mdoel/request/change_password_request.dart';
import '../../data/mdoel/request/edit_user_info_request.dart';
import '../entities/app_user_entity.dart';
import '../entities/change_password_entity.dart';

abstract class ProfileRepository{
  Future<Result<AppUserEntity>>getUserInfo();
  Future<Result<AppUserEntity>>editProfileData(EditUserInfoRequest updateUserRequest);
  Future<Result<ChangePasswordEntity>>changePassword(ChangePasswordRequest changePasswordRequest);


}
