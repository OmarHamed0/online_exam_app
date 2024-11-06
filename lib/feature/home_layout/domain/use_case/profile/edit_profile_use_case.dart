import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/domain/entities/app_user_entity.dart';

import '../../../../../core/api/api_result.dart';
import '../../../data/mdoel/request/edit_user_info_request.dart';
import '../../repository/profile_repository.dart';


@injectable
class EditProfileUseCase{
  final  ProfileRepository _profileRepository;
  EditProfileUseCase(this._profileRepository);

  Future<Result<AppUserEntity>>  invoke(EditUserInfoRequest updateUserRequest)async{
     return await _profileRepository.editProfileData(updateUserRequest);
   }
}