import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_result.dart';
import '../../../data/mdoel/response/subject_model/Subject_model.dart';
import '../../repository/explore_repository.dart';
@injectable
class GetAllSubjectsUseCase {
  ExploreRepository repository;
  GetAllSubjectsUseCase({required this.repository});
  Future<Result<SubjectModel?>> invoke() {
    return repository.getAllSubjects();
  }
}