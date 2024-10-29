import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_offline_data_source/explore_offline_data_source.dart';
import 'package:online_exam/feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';
import 'package:online_exam/feature/home_layout/domain/repository/explore_repository.dart';

import '../mdoel/request/CheckQuestionsRequesrt.dart';
import '../mdoel/response/subject_model/Subject_model.dart';

@Injectable(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource exploreRemoteDataSource;
  final ExploreOfflineDataSource exploreOfflineDataSource;
  ExploreRepositoryImpl(
      {required this.exploreRemoteDataSource,
      required this.exploreOfflineDataSource});
  @override
  Future<Result<SubjectModel?>> getAllSubjects() {
    return exploreRemoteDataSource.getAllSubjects();
  }

  @override
  Future<Result<GetAllExamsModel?>> getAllExams(String subjectId) {
    return exploreRemoteDataSource.getAllExams(subjectId);
  }

  @override
  Future<Result<GetAllQuestionsModel?>> getAllQuestions(String examId) {
    return exploreRemoteDataSource.getAllQuestions(examId);
  }

  @override
  Future<Result<CheckQuestionsModel?>> checkQuestions(CheckQuestionsRequest request) {
return exploreRemoteDataSource.checkQuestions(request);
  }


}
