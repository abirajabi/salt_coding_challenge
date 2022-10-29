import 'package:dartz/dartz.dart';
import 'package:salt_coding_challenge/data/news_articles_result.dart';
import 'package:salt_coding_challenge/domain/repositories/news_repositories.dart';

import '../../core/error/failures.dart';

class GetHeadlineNews {
  final NewsRepositories _newsRepositories;

  GetHeadlineNews(this._newsRepositories);

  Future<Either<Failure, List<Article>>> execute() async {
    return await _newsRepositories.getHeadlineNews();
  }
}
