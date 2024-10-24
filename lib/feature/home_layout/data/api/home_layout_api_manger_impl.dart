import 'package:dio/dio.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
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
        options: Options(headers: {"token": token}));
    SubjectModel getAllSubjects = SubjectModel.fromJson(
      response.data,
    );
    return getAllSubjects;
  }

  @override
  Future<GetAllExamsModel?> getAllExams() async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(
      ApiConstants.getAllExamsApi,
      options: Options(headers: {"token": token}),
    );
    GetAllExamsModel getAllExams = GetAllExamsModel.fromJson(response.data);
    return getAllExams;
  }

  @override
  Future<GetAllQuestionsModel?> getAllQuestions() async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(ApiConstants.getAllQuestionsApi,
        options: Options(headers: {"token": token}));
    GetAllQuestionsModel getAllQuestions =
        GetAllQuestionsModel.fromJson(response.data);
    return getAllQuestions;
  }

}
