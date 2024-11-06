import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/domain/entities/app_user_entity.dart';

import '../../repository/profile_repository.dart';


@singleton
@injectable
class GetUserInfoUseCase{
  final  ProfileRepository _profileRepository;
  GetUserInfoUseCase(this._profileRepository);
  Future<Result<AppUserEntity>> invoke()async{
    return await  _profileRepository.getUserInfo();
  }
}