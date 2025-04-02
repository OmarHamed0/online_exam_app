import 'dart:core';

import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import '../../../../core/api/api_result.dart';
import '../../data/mdoel/request/CheckQuestionsRequesrt.dart';
import '../../data/mdoel/response/get_all_qeastions_model/Exam.dart';
import '../../data/mdoel/response/get_all_qeastions_model/Questions.dart';
import '../../data/mdoel/response/subject_model/Subject_model.dart';

abstract class ExploreRepository {
  Future<Result<SubjectModel?>> getAllSubjects();
  Future<Result<GetAllExamsModel?>> getAllExams(String subjectId);
  Future<Result<GetAllQuestionsModel?>> getAllQuestions(String examId,);
  Future<Result<CheckQuestionsModel?>> checkQuestions(CheckQuestionsRequest request);
  Future<Result<void>> addExam(Exam exam, List<Questions?> questions);
  Future<Result<List<Exam>>> getExamsList();
}
