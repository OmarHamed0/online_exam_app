import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import '../mdoel/request/CheckQuestionsRequesrt.dart';
import '../mdoel/response/subject_model/Subject_model.dart';

abstract class HomeLayoutApiManger {
  Future<SubjectModel?> getAllSubjects();
  Future<GetUserHistoryModel?> getUserHistoryModel();
  Future<GetAllExamsModel?> getAllExams(String subjectId);
  Future<GetAllQuestionsModel?> getAllQuestions(String examId);
  Future<CheckQuestionsModel?>checkQuestions(CheckQuestionsRequest request);
}
