import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../core/api/execute_api_call.dart';
import '../../../api/home_layout_api_manger.dart';
import '../../../mdoel/request/CheckQuestionsRequesrt.dart';
import '../../../mdoel/response/subject_model/Subject_model.dart';
import 'explore_remote_data_source.dart';

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  HomeLayoutApiManger apiManger;
  ExploreRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Result<SubjectModel?>> getAllSubjects() async {
    return executeApiCall<SubjectModel?>(apiCall: () async {
      var response = await apiManger.getAllSubjects();
      return response;
    });
  }

  @override
  Future<Result<GetAllExamsModel?>> getAllExams(String subjectId) async {
    return executeApiCall<GetAllExamsModel?>(apiCall: () async {
      var response = await apiManger.getAllExams(subjectId);
      return response;
    });
  }

  @override
  Future<Result<GetAllQuestionsModel?>> getAllQuestions() async {
    return executeApiCall<GetAllQuestionsModel?>(apiCall: () async {
      var response = await apiManger.getAllQuestions();
      return response;
    });
  }

}
