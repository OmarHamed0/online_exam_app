import '../../../../../../core/api/api_result.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../../../../domain/entities/change_password_entity.dart';
import '../../../mdoel/request/change_password_request.dart';
import '../../../mdoel/request/edit_user_info_request.dart';

  abstract class ProfileRemoteDataSource{
    Future<Result<AppUserEntity>>getUserInfo();
    Future<Result<AppUserEntity>>editProfileData(EditUserInfoRequest updateUserRequest);
    Future<Result<ChangePasswordEntity>>changePassword(ChangePasswordRequest changePasswordRequest);
}
