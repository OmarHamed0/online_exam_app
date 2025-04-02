import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/change_password_request.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/request/edit_user_info_request.dart';
import 'package:online_exam/feature/home_layout/domain/entities/change_password_entity.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../core/api/execute_api_call.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../../../api/home_layout_api_manger.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final HomeLayoutApiManger homeLayoutApiManger;
  ProfileRemoteDataSourceImpl({required this.homeLayoutApiManger});

  @override
  Future<Result<ChangePasswordEntity>> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    return await executeApiCall<ChangePasswordEntity>(
      apiCall: () async {
        var changPasswordModel =
            await homeLayoutApiManger.changePassword(changePasswordRequest);
        return ChangePasswordEntity(
            massage: changPasswordModel.message,
            token: changPasswordModel.token);
      },
    );
  }

  @override
  Future<Result<AppUserEntity>> editProfileData(
      EditUserInfoRequest updateUserRequest) async {
    return await executeApiCall<AppUserEntity>(apiCall: () async {
      var appUserModel =
          await homeLayoutApiManger.editProfileData(updateUserRequest);
      return AppUserEntity(
          id: appUserModel.user?.id,
          phone: appUserModel.user?.phone,
          username: appUserModel.user?.username,
          email: appUserModel.user?.email,
          firstName: appUserModel.user?.firstName,
          lastName: appUserModel.user?.lastName);
    });
  }

  @override
  Future<Result<AppUserEntity>> getUserInfo() async {
    return await executeApiCall<AppUserEntity>(apiCall: () async {
      var appUserModel = await homeLayoutApiManger.getUserInfo();
      return AppUserEntity(
          id: appUserModel.user?.id,
          phone: appUserModel.user?.phone,
          username: appUserModel.user?.username,
          email: appUserModel.user?.email,
          firstName: appUserModel.user?.firstName,
          lastName: appUserModel.user?.lastName);
    });
  }
}
