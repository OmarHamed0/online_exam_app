
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';

import '../../../../core/api/api_result.dart';
import '../../data/mdoel/response/subject_model/Subject_model.dart';

abstract class ExploreRepository {
  Future<Result<SubjectModel?>> getAllSubjects();
  Future<Result<GetAllExamsModel?>>getAllExams();
}
