import 'package:salt_coding_challenge/data/news_articles_result.dart';

abstract class NewsLocalDatasource {
  getCachedHeadlineNews() {}

  void cacheHeadlineNews(List<Article> articles) {}
}

class NewsLocalDatasourceImpl implements NewsLocalDatasource {
  

  @override
  getCachedHeadlineNews() {
    throw UnimplementedError();
  }

  @override
  void cacheHeadlineNews(List<Article> articles) {
    // TODO: implement replaceStoredHeadlineNews
  }
}
