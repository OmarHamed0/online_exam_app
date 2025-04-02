import 'package:online_exam/feature/home_layout/data/mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../domain/entities/GetAllQuestionsEntity.dart';

abstract class ExploreOfflineDataSource{
  Future<Result<void>> addExam(ExamModel exam, List<Questions?> questions);
  Future<Result<List<ExamModel>>> getExamsList();
}