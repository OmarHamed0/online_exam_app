import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/check_questions_model/CheckQuestionsModel.dart';

import '../../../../../core/api/api_result.dart';
import '../../../data/mdoel/request/CheckQuestionsRequesrt.dart';
import '../../repository/explore_repository.dart';

@injectable
class CheckQuestionsUseCase {
  ExploreRepository repository;
  CheckQuestionsUseCase({required this.repository});
  Future<Result<CheckQuestionsModel?>> invoke(CheckQuestionsRequest request) {
    return repository.checkQuestions(request);
  }
}
