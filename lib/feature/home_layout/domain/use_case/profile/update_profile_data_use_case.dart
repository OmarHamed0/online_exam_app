import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/user_model.dart';
import 'package:online_exam/feature/home_layout/domain/repository/profile_repository.dart';

import '../../../../../core/api/api_result.dart';
import '../../../data/mdoel/profile/profile_request.dart';
import '../../entities/app_user_entity.dart';

@injectable
class UpdateProfileDataUseCase{
  final ProfileRepository profileRepository;
  UpdateProfileDataUseCase({required this.profileRepository});


  Future<Result<AppUserEntity?>> invoke({required ProfileRequest profileRequest}){
    return profileRepository.updateProfile(profileRequest: profileRequest);
   }
}