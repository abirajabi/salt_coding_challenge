import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:salt_coding_challenge/core/constants.dart';
import 'package:salt_coding_challenge/core/error/exception.dart';

import '../news_articles_result.dart';

abstract class NewsRemoteDataSource {
  Future<NewsArticleResult> getHeadlineNews();
}

// TODO : base data source with deafult client

@Singleton(as: NewsRemoteDataSource)
class NewsRemoteDatasourceImpl implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDatasourceImpl(this.client);

  @override
  Future<NewsArticleResult> getHeadlineNews() async {
    final response = await client.get(Uri.parse(
        "$baseNewsApiUrl/top-headlines?country=id&apiKey=${dotenv.env["NEWS_API_KEY"]}"));

    if (response.statusCode == 200) {
      return Future.value(
          NewsArticleResult.fromJson(jsonDecode(response.body)));
    } else {
      throw ServerException();
    }
  }
}
