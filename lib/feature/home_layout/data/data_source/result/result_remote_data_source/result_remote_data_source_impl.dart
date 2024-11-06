 import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../core/api/execute_api_call.dart';
import '../../../api/home_layout_api_manger.dart';
import '../../../mdoel/response/GetUserHistoryModel.dart';
import 'result_remote_data_source.dart';

 @Injectable(as: ResultRemoteDataSource)
 class ResultRemoteDataSourceImpl implements ResultRemoteDataSource {
   HomeLayoutApiManger apiManger;
   ResultRemoteDataSourceImpl({required this.apiManger});
   @override
   Future<Result<GetUserHistoryModel?>> getUserHistory() {
     return executeApiCall<GetUserHistoryModel?>(apiCall: () async {
       var response = await apiManger.getUserHistoryModel();
       return response;
     });
   }
 }
