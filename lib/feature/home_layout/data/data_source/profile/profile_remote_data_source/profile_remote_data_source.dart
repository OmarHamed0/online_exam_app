import 'package:online_exam/feature/home_layout/data/mdoel/profile/profile_request.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../../../mdoel/response/app_user/user_model.dart';

  abstract class ProfileRemoteDataSource{
    Future<Result<AppUserEntity?>>getProfileData();
    Future<Result<AppUserEntity?>>updateProfile({required ProfileRequest profileRequest});
}
