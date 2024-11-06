import 'package:dio/dio.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/domain/entities/Answers.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/caching/token_manger.dart';
import '../../domain/entities/GetExamById.dart';
import '../mdoel/request/CheckQuestionsRequesrt.dart';
import '../mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';
import '../mdoel/response/subject_model/Subject_model.dart';
import 'home_layout_api_manger.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/Answers.dart';

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
  Future<GetAllExamsModel?> getAllExams(String subjectId) async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(
      ApiConstants.getAllExamsApi,
      queryParameters: {"subject": subjectId},
      options: Options(headers: {"token": token}),
    );
    GetAllExamsModel getAllExams = GetAllExamsModel.fromJson(response.data);
    return getAllExams;
  }

  @override
  Future<GetAllQuestionsModel?> getAllQuestions(String examId) async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(ApiConstants.getAllQuestionsApi,
        queryParameters: {
          "exam": examId,
        },
        options: Options(headers: {"token": token}));
    GetAllQuestionsModel getAllQuestions =
        GetAllQuestionsModel.fromJson(response.data);
    return getAllQuestions;
  }

  @override
  Future<CheckQuestionsModel?> checkQuestions(
      CheckQuestionsRequest request) async {
    var token = await TokenManger.getToken();
    var response = await _dio.post(
      ApiConstants.checkQuestionsApi,
      options: Options(
        headers: {"token": token},
      ),
      data: request.toJson(),
    );
    CheckQuestionsModel checkQuestions =
        CheckQuestionsModel.fromJson(response.data);
    return checkQuestions;
  }

  @override
  Future<GetUserHistoryModel?> getUserHistoryModel() async {
    var token = await TokenManger.getToken();
    var response = await _dio.get(ApiConstants.getUserHistoryApi,
        options: Options(headers: {"token": token}));
    GetUserHistoryModel getUserHistory = GetUserHistoryModel.fromJson(
      response.data,
    );
    return getUserHistory;
  }
}
