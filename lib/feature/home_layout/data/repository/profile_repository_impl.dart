
/***************
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result.dart';
import '../../domain/entities/app_user_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl({required this.profileRemoteDataSource});
  @override
  Future<Result<AppUserEntity?>> getLoggedUserInfo() {
    return profileRemoteDataSource.getProfileData();
  }
}
****************/