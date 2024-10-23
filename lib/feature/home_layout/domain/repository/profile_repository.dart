
import '../../../../core/api/api_result.dart';
import '../../data/mdoel/profile/profile_request.dart';
import '../../data/mdoel/response/app_user/user_model.dart';
import '../entities/app_user_entity.dart';

abstract class ProfileRepository{
  Future<Result<AppUserEntity?>>getProfileData();
  Future<Result<AppUserEntity?>>updateProfile({required ProfileRequest profileRequest});
}
