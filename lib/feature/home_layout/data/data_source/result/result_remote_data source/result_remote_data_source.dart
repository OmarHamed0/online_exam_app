import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/get_exam_by_id_model/GetExamByIdModel.dart';


abstract class ResultRemoteDataSource{
  Future<Result<ExamModel  ?>>getUserHistory();
}