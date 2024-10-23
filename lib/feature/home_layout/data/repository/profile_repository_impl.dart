
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/user_model.dart';

import '../../../../core/api/api_result.dart';
import '../../domain/entities/app_user_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
import '../mdoel/profile/profile_request.dart';
@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl({required this.profileRemoteDataSource});
  @override
  Future<Result<AppUserEntity?>> getProfileData() {
    return profileRemoteDataSource.getProfileData();
  }

  @override
  Future<Result<AppUserEntity?>> updateProfile({required ProfileRequest profileRequest}) {
    return profileRemoteDataSource.updateProfile(profileRequest: profileRequest);

  }

}
