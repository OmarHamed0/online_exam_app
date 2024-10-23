import 'package:dio/dio.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/app_user_model.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/user_model.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/caching/token_manger.dart';
import '../mdoel/profile/profile_request.dart';
import '../mdoel/response/subject_model/Subject_model.dart';
import 'home_layout_api_manger.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLayoutApiManger)
class HomeLayoutApiMangerImpl implements HomeLayoutApiManger {
  late Dio _dio;
  HomeLayoutApiMangerImpl() {
    _dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60)));
    _dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      request: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ));
  }

  @override
  Future<SubjectModel?> getAllSubjects() async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(
      ApiConstants.getAllSubjectsApi,
    );
    SubjectModel getAllSubjects = SubjectModel.fromJson(
      response.data,
    );
    return getAllSubjects;
  }

  @override
  Future<AppUserModel> getProfileData() async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(ApiConstants.getProfileData,
        options: Options(
          headers: {"token": token},
        ));
    return AppUserModel.fromJson(response.data);
  }

  @override
  Future<AppUserModel> updateProfileData({required ProfileRequest profileRequest}) async {
    var token = "awaitTokenManger.getToken()";
    var response = await _dio.put(ApiConstants.updateProfileData,
        data: profileRequest.toJson(),
        options: Options(
          headers: {"token": token},
        ));
    return AppUserModel.fromJson(response.data);
  }
}
