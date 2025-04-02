import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result.dart';
import '../../../data/mdoel/response/get_all_qeastions_model/Exam.dart';
import '../../../data/mdoel/response/get_all_qeastions_model/Questions.dart';
import '../../repository/explore_repository.dart';

@injectable
class SubmitExamUseCase {
  final ExploreRepository _repository;

  SubmitExamUseCase(this._repository);

  Future<Result<void>> call(Exam exam, List<Questions > questions) async =>
      await _repository.addExam(exam, questions);
}

