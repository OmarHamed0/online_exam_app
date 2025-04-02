

import '../../../../core/api/api_result.dart';
import '../entities/cached_exam_result_entity.dart';

abstract class GetExamByIdRepository{
  Future<Result<List<CachedExamResultEntity>>> getExamById();
}