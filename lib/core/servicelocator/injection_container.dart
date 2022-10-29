import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:salt_coding_challenge/data/localdatasource/news_local_datasource.dart';
import 'package:salt_coding_challenge/data/remotedatasource/news_remote_datasource.dart';
import 'package:salt_coding_challenge/domain/usecases/get_headline_news.dart';
import 'package:salt_coding_challenge/presentation/headlinenews/cubit/headline_news_cubit.dart';

import '../../data/repositories/news_repositories_impl.dart';
import '../../domain/repositories/news_repositories.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerFactory(() => HeadlineNewsCubit(sl()));
  sl.registerLazySingleton(() => GetHeadlineNews(sl()));
  sl.registerLazySingleton<NewsRepositories>(
      () => NewsRepositoriesImpl(sl(), sl()));
  sl.registerLazySingleton<NewsRemoteDatasource>(
      () => NewsRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<NewsLocalDatasource>(
      () => NewsLocalDatasourceImpl());

  sl.registerLazySingleton(() => http.Client());
}
