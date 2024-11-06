
import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';

import '../../../../core/api/api_result.dart';

abstract class ResultRepository{
  Future<Result<GetUserHistoryModel?>> getUserHistory();

}
