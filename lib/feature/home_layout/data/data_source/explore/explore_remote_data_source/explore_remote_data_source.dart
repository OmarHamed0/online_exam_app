import '../../../../../../core/api/api_result.dart';
import '../../../mdoel/response/subject_model/Subject_model.dart';

abstract class ExploreRemoteDataSource{
  Future<Result<SubjectModel?>>getAllSubjects();
}