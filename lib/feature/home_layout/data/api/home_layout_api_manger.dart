


import 'package:online_exam/feature/home_layout/data/mdoel/profile/profile_request.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/app_user/user_model.dart';

import '../mdoel/response/app_user/app_user_model.dart';
import '../mdoel/response/subject_model/Subject_model.dart';

abstract class HomeLayoutApiManger{
  Future<SubjectModel?>getAllSubjects();
  Future<AppUserModel>getProfileData();
  Future<AppUserModel>updateProfileData({required ProfileRequest profileRequest});

}