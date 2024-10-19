
import '../mdoel/response/app_user/app_user_model.dart';
import '../mdoel/response/subject_model/Subject_model.dart';

abstract class HomeLayoutApiManger{
  Future<SubjectModel>getAllSubject();
  Future<AppUserModel?>getProfileDats();


}