import 'package:salt_coding_challenge/core/error/failures.dart';
import 'package:salt_coding_challenge/core/multiple_result.dart';

abstract class UseCaseWithParams<ReturnType, Params> {
  Future<ResultEntity<Failure, ReturnType>> call(Params params);
}

abstract class UseCase<ReturnType> {
  Future<ResultEntity<Failure, ReturnType>> call();
}
