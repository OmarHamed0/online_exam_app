import 'package:dio/dio.dart';
import '../../../../core/api/api_constants.dart';
import '../mdoel/response/app_user/app_user_model.dart';
import '../mdoel/response/subject_model/Subject_model.dart';
import 'home_layout_api_manger.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLayoutApiManger)
class HomeLayoutApiMangerImpl implements HomeLayoutApiManger {
  late Dio _dio;
  HomeLayoutApiMangerImpl() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ));
    _dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      request: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ));
  }

  @override
  Future<SubjectModel> getAllSubject() async {
    var response = await _dio.get(ApiConstants.getAllSubjectsApi);
    return SubjectModel.fromJson(response.data);
  }

  @override
  Future<AppUserModel?> getProfileDats() async {
    var response = await _dio.get(ApiConstants.profileData);
    return AppUserModel.fromJson(response.data);
  }
}
