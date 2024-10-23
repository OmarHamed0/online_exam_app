import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/data_source/profile/profile_remote_data_source/profile_remote_data_source.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/profile/profile_request.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../core/api/execute_api_call.dart';
import '../../../../domain/entities/app_user_entity.dart';
import '../../../api/home_layout_api_manger.dart';
@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final HomeLayoutApiManger homeLayoutApiManger;
  ProfileRemoteDataSourceImpl({required this.homeLayoutApiManger});
  @override
  Future<Result<AppUserEntity?>> getProfileData() async {
   var response=await executeApiCall<AppUserEntity?>(
       apiCall: () async{
         var response=await  homeLayoutApiManger.getProfileData();
        return response.user?.appUserEntity();
       },);
   return response;
  }

  @override
  Future<Result<AppUserEntity?>> updateProfile({required ProfileRequest profileRequest})async {
    var response=await executeApiCall<AppUserEntity?>(apiCall: () async{
      var response=await homeLayoutApiManger.updateProfileData(profileRequest: profileRequest);
      return response.user?.appUserEntity();
    },);
    return response;
  }
}
