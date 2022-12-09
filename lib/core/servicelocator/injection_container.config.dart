// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:salt_coding_challenge/core/servicelocator/external_module.dart'
    as _i10;
import 'package:salt_coding_challenge/data/localdatasource/news_local_datasource.dart'
    as _i4;
import 'package:salt_coding_challenge/data/remotedatasource/news_remote_datasource.dart'
    as _i5;
import 'package:salt_coding_challenge/data/repositories/news_repositories_impl.dart'
    as _i7;
import 'package:salt_coding_challenge/domain/repositories/news_repositories.dart'
    as _i6;
import 'package:salt_coding_challenge/domain/usecases/get_headline_news.dart'
    as _i8;
import 'package:salt_coding_challenge/presentation/headlinenews/cubit/headline_news_cubit.dart'
    as _i9;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final baseClient = _$BaseClient();
    gh.singleton<_i3.Client>(baseClient.httpClient);
    gh.singleton<_i4.NewsLocalDatasource>(_i4.NewsLocalDatasourceImpl());
    gh.singleton<_i5.NewsRemoteDataSource>(
        _i5.NewsRemoteDatasourceImpl(gh<_i3.Client>()));
    gh.singleton<_i6.NewsRepositories>(_i7.NewsRepositoriesImpl(
      gh<_i5.NewsRemoteDataSource>(),
      gh<_i4.NewsLocalDatasource>(),
    ));
    gh.singleton<_i8.GetHeadlineNews>(
        _i8.GetHeadlineNews(gh<_i6.NewsRepositories>()));
    gh.factory<_i9.HeadlineNewsCubit>(
        () => _i9.HeadlineNewsCubit(gh<_i8.GetHeadlineNews>()));
    return this;
  }
}

class _$BaseClient extends _i10.BaseClient {}
