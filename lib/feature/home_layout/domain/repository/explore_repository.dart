
import '../../../../core/api/api_result.dart';
import '../../data/mdoel/response/subject_model/Subject_model.dart';

abstract class ExploreRepository {
  Future<Result<SubjectModel?>> getAllSubjects();
}
