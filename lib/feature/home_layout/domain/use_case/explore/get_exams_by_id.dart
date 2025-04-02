import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result.dart';
import '../../entities/cached_exam_result_entity.dart';
import '../../repository/result_repository.dart';

@injectable
class GetAllExamsUseCase {
  GetExamByIdRepository repository;
  GetAllExamsUseCase({required this.repository});
  Future<Result<List<CachedExamResultEntity>>> invoke() {
    return repository.getExamById();
  }
}
