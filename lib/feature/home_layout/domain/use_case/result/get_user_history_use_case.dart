import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/home_layout/data/mdoel/response/GetUserHistoryModel.dart';
import 'package:online_exam/feature/home_layout/domain/repository/result_repository.dart';

import '../../../../../core/api/api_result.dart';

@injectable
class GetUserHistoryUseCase {
  ResultRepository repository;
  GetUserHistoryUseCase({required this.repository});
  Future<Result<GetUserHistoryModel?>> invoke() {
    return repository.getUserHistory();
  }
}
