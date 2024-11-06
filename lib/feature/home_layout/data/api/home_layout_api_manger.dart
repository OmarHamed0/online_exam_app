import 'package:online_exam/feature/home_layout/data/mdoel/request/change_password_request.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/app_user_model.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import '../mdoel/request/CheckQuestionsRequesrt.dart';
import '../mdoel/request/edit_user_info_request.dart';
import '../mdoel/response/change_password/change_password_response.dart';
import '../mdoel/response/subject_model/Subject_model.dart';

abstract class HomeLayoutApiManger {
  Future<SubjectModel?> getAllSubjects();
  Future<GetAllExamsModel?> getAllExams(String subjectId);
  Future<GetAllQuestionsModel?> getAllQuestions(String examId);
  Future<CheckQuestionsModel?> checkQuestions(CheckQuestionsRequest request);

  Future<AppUserModel> getUserInfo();

  Future<AppUserModel> editProfileData(EditUserInfoRequest updateUserRequest);
  Future<ChangePasswordResponse>changePassword(ChangePasswordRequest changePassword);

}
