


import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';

import '../mdoel/response/subject_model/Subject_model.dart';

abstract class HomeLayoutApiManger{
  Future<SubjectModel?>getAllSubjects();
  Future<GetAllExamsModel?>getAllExams();

}