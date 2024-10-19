
import '../../../../core/api/api_result.dart';
import '../entities/app_user_entity.dart';

abstract class ProfileRepository{
  Future<Result<AppUserEntity?>>getLoggedUserInfo();

}
