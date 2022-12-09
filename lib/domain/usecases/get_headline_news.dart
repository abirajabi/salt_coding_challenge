import 'package:injectable/injectable.dart';
import 'package:salt_coding_challenge/core/multiple_result.dart';
import 'package:salt_coding_challenge/data/news_articles_result.dart';
import 'package:salt_coding_challenge/domain/repositories/news_repositories.dart';
import 'package:salt_coding_challenge/domain/usecases/base_use_case.dart';

import '../../core/error/failures.dart';

@singleton
class GetHeadlineNews extends UseCase<List<Article>> {
  final NewsRepositories _newsRepositories;

  GetHeadlineNews(this._newsRepositories);

  @override
  Future<ResultEntity<Failure, List<Article>>> call() async {
    return await _newsRepositories.getHeadlineNews();
  }
}

class GetHeadlineNewsParams {}
