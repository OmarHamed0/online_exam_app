import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';
import '../../domain/entities/Answers.dart';
import '../mdoel/request/CheckQuestionsRequesrt.dart';
import '../mdoel/response/subject_model/Subject_model.dart';

abstract class HomeLayoutApiManger {
  Future<SubjectModel?> getAllSubjects();
  Future<GetAllExamsModel?> getAllExams(String subjectId);
  Future<GetAllQuestionsModel?> getAllQuestions();
}
