
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/change_password_request.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/edit_user_info_request.dart';
import 'package:online_exam/feature/home_layout/domain/entities/change_password_entity.dart';

import '../../../../core/api/api_result.dart';
import '../../domain/entities/app_user_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Result<ChangePasswordEntity>> changePassword(ChangePasswordRequest changePasswordRequest) {
    return profileRemoteDataSource.changePassword(changePasswordRequest);
  }

  @override
  Future<Result<AppUserEntity>> editProfileData(EditUserInfoRequest updateUserRequest) {
   return profileRemoteDataSource.editProfileData(updateUserRequest);
  }

  @override
  Future<Result<AppUserEntity>> getUserInfo() {
    return profileRemoteDataSource.getUserInfo();
  }

}
