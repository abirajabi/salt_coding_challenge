import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:salt_coding_challenge/core/servicelocator/injection_container.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureInjection() => getIt.init();

// Future<void> setupLocator() async {
//   // BLOC / CUBIT / CONTROLLER
//   getIt.registerFactory(() => HeadlineNewsCubit(getIt()));
//
//   // USE CASE
//   getIt.registerLazySingleton(() => GetHeadlineNews(getIt()));
//
//   // REPO
//   getIt.registerLazySingleton<NewsRepositories>(
//       () => NewsRepositoriesImpl(getIt(), getIt()));
//
//   // DATA
//   getIt.registerLazySingleton<NewsRemoteDatasource>(
//       () => NewsRemoteDatasourceImpl(getIt()));
//   getIt.registerLazySingleton<NewsLocalDatasource>(
//       () => NewsLocalDatasourceImpl());
//
//   // CLIENT DIO / HTTP
//   getIt.registerLazySingleton(() => http.Client());
// }
