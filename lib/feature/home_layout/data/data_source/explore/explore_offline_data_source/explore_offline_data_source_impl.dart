 import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';
import 'package:online_exam/feature/home_layout/domain/entities/GetAllQuestionsEntity.dart';

import 'explore_offline_data_source.dart';

@Injectable(as: ExploreOfflineDataSource)
class ExploreOfflineDataSourceImpl implements ExploreOfflineDataSource{
  @override
  Future<Result<void>> addExam(ExamModel exam, List<Questions?> questions) {
    // TODO: implement addExam
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ExamModel>>> getExamsList() {
    // TODO: implement getExamsList
    throw UnimplementedError();
  }
}