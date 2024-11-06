import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';
import 'package:online_exam/feature/home_layout/domain/repository/result_repository.dart';

import '../data_source/result/result_offline_data_source/result_offline_data_source.dart';
import '../data_source/result/result_remote_data_source/result_remote_data_source.dart';

@Injectable(as: ResultRepository)
class ResultRepositoryImpl implements ResultRepository {
  final ResultRemoteDataSource resultRemoteDataSource;
  final ResultOfflineDataSource resultOfflineDataSource;
  ResultRepositoryImpl(
      {required this.resultOfflineDataSource,
      required this.resultRemoteDataSource});

  @override
  Future<Result<GetUserHistoryModel?>> getUserHistory() {
    return resultRemoteDataSource.getUserHistory();
  }
}
