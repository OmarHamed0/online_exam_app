import '../../../../../../core/api/api_result.dart';
import '../../../mdoel/response/GetUserHistoryModel.dart';

abstract class ResultRemoteDataSource{
  Future<Result<GetUserHistoryModel?>>getUserHistory();
}