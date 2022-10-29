import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salt_coding_challenge/core/error/failures.dart';
import 'package:salt_coding_challenge/data/localdatasource/news_local_datasource.dart';
import 'package:salt_coding_challenge/data/news_articles_result.dart';
import 'package:salt_coding_challenge/data/remotedatasource/news_remote_datasource.dart';

import '../../core/error/exception.dart';
import '../../domain/repositories/news_repositories.dart';

class NewsRepositoriesImpl extends NewsRepositories {
  final NewsRemoteDatasource remoteDatasource;
  final NewsLocalDatasource localDatasource;

  NewsRepositoriesImpl(this.remoteDatasource, this.localDatasource);

  @override
  Future<Either<Failure, List<Article>>> getHeadlineNews() async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        final NewsArticleResult headlineNews =
            await remoteDatasource.getHeadlineNews();
        localDatasource.cacheHeadlineNews(headlineNews.articles);
        return Right(headlineNews.articles);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localHeadlineNews = await localDatasource.getCachedHeadlineNews();
        return Right(localHeadlineNews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
