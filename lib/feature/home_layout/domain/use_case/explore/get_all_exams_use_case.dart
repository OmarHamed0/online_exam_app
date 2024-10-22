import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/gel_all_exams_model/GetAllExamsModel.dart';
import 'package:online_exam/feature/home_layout/domain/repository/explore_repository.dart';
@injectable
class GetAllExamsUseCase {
  ExploreRepository repository;
  GetAllExamsUseCase({required this.repository});
  Future<Result<GetAllExamsModel?>> invoke() {
    return repository.getAllExams();
  }
}
