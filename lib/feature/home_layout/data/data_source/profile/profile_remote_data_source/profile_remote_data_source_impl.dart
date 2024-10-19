
import 'package:online_exam/feature/home_layout/data/data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/app_user_model.dart';

import '../../../../../../core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/execute_api_call.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../../../api/home_layout_api_manger.dart';
@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final HomeLayoutApiManger homeLayoutApiManger;
  ProfileRemoteDataSourceImpl({required this.homeLayoutApiManger});
  @override
  Future<Result<AppUserEntity?>> getProfileData() async {
    return executeApiCall<AppUserEntity>(
      apiCall: () async {
        var    appUserModel = await homeLayoutApiManger.getProfileDats();
        return AppUserEntity(
          id: appUserModel?.user?.id,
          email: appUserModel?.user?.email,
          lastName: appUserModel?.user?.lastName,
          firstName: appUserModel?.user?.firstName,
          username: appUserModel?.user?.username,
          phone: appUserModel?.user?.phone,
        );
      },
    );
  }
}
