
import '../../../../../core/api/api_result.dart';
import '../../entities/app_user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repository/profile_repository.dart';
@injectable
class GetProfileDataUseCase{
 final ProfileRepository profileRepository;
 GetProfileDataUseCase({required this.profileRepository});

 Future<Result<AppUserEntity?>>invoke(){
   return profileRepository.getLoggedUserInfo();
 }
}