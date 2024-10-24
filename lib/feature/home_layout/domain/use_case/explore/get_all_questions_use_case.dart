import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_all_qeastions_model/GetAllQuestionsModel.dart';
import 'package:online_exam/feature/home_layout/domain/repository/explore_repository.dart';
import '../../../../../core/api/api_result.dart';
@injectable

class GetAllQuestionsUseCase{
  ExploreRepository repository;
  GetAllQuestionsUseCase({required this.repository});
  Future<Result<GetAllQuestionsModel?>>invoke(){
    return repository.getAllQuestions();
  }
}