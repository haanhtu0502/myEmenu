// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../../mvvm/data/data_source/remote/token/token_api.dart' as _i5;
import '../../mvvm/data/model/home_info/home_info_storage.dart' as _i7;
import '../../mvvm/repository/auth_repositories.dart' as _i6;
import 'module/data_source_module.dart' as _i8;
import 'module/hive_module.dart' as _i9;

const String _prod = 'prod';
const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataSourceModule = _$DataSourceModule();
  final hiveModule = _$HiveModule();
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(),
    registerFor: {_prod},
  );
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioDev(),
    registerFor: {_dev},
  );
  await gh.singletonAsync<_i4.HiveInterface>(
    () => hiveModule.init(),
    preResolve: true,
  );
  gh.factory<_i5.TokenApi>(() => _i5.TokenApi(gh<_i3.Dio>()));
  gh.factory<_i6.AuthRepositories>(
      () => _i6.AuthRepositories(gh<_i5.TokenApi>()));
  gh.singleton<_i4.Box<_i7.HomeInfoStorage>>(
      () => hiveModule.homeInfoBox(gh<_i4.HiveInterface>()));
  return getIt;
}

class _$DataSourceModule extends _i8.DataSourceModule {}

class _$HiveModule extends _i9.HiveModule {}
