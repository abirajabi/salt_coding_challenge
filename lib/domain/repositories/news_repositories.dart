import 'package:dartz/dartz.dart';
import 'package:salt_coding_challenge/data/news_articles_result.dart';

import '../../core/error/failures.dart';

abstract class NewsRepositories {
  Future<Either<Failure, List<Article>>> getHeadlineNews();
}
