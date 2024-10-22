import 'package:dio/dio.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/caching/token_manger.dart';
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
  Future<SubjectModel?> getAllSubjects() async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(ApiConstants.getAllSubjectsApi,
    options: Options(
      headers: {
        "token":token
      }
    )
    );
    SubjectModel getAllSubjects = SubjectModel.fromJson(response.data,);
    return getAllSubjects;
  }
}
