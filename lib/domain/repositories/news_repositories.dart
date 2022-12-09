import 'package:salt_coding_challenge/core/multiple_result.dart';
import 'package:salt_coding_challenge/data/news_articles_result.dart';

import '../../core/error/failures.dart';

// abstract class NewsRepositories {
//   Future<Either<Failure, List<Article>>> getHeadlineNews();
// }

abstract class NewsRepositories {
  Future<ResultEntity<Failure, List<Article>>> getHeadlineNews();
}
