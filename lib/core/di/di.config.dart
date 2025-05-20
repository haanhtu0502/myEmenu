// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i12;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../../mvvm/data/data_source/local/home_info_local_storage.dart' as _i11;
import '../../mvvm/data/data_source/remote/config/emenu_config_api.dart' as _i4;
import '../../mvvm/data/data_source/remote/token/token_api.dart' as _i8;
import '../../mvvm/data/model/home_info/home_info_storage.dart' as _i10;
import '../../mvvm/repository/auth_repositories.dart' as _i9;
import '../../mvvm/repository/emenu_config_repositories.dart' as _i5;
import '../../mvvm/viewmodel/home/home_provider.dart' as _i13;
import '../../mvvm/viewmodel/login/login_provider.dart' as _i7;
import 'module/data_source_module.dart' as _i14;
import 'module/hive_module.dart' as _i15;

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
  gh.factory<_i4.EmenuConfigApi>(() => _i4.EmenuConfigApi(gh<_i3.Dio>()));
  gh.factory<_i5.EmenuConfigRepositories>(
      () => _i5.EmenuConfigRepositories(gh<_i4.EmenuConfigApi>()));
  await gh.singletonAsync<_i6.HiveInterface>(
    () => hiveModule.init(),
    preResolve: true,
  );
  gh.factory<_i7.LoginProvider>(() => _i7.LoginProvider());
  gh.factory<_i8.TokenApi>(() => _i8.TokenApi(gh<_i3.Dio>()));
  gh.factory<_i9.AuthRepositories>(
      () => _i9.AuthRepositories(gh<_i8.TokenApi>()));
  gh.singleton<_i6.Box<_i10.HomeInfoStorage>>(
      () => hiveModule.homeInfoBox(gh<_i6.HiveInterface>()));
  gh.factory<_i11.HomeInfoLocalStorage>(
      () => _i11.HomeInfoLocalStorage(gh<_i12.Box<_i10.HomeInfoStorage>>()));
  gh.factoryParam<_i13.HomeProvider, String?, dynamic>((
    hashParam,
    _,
  ) =>
      _i13.HomeProvider(
        hashParam,
        gh<_i9.AuthRepositories>(),
        gh<_i5.EmenuConfigRepositories>(),
        gh<_i7.LoginProvider>(),
      ));
  return getIt;
}

class _$DataSourceModule extends _i14.DataSourceModule {}

class _$HiveModule extends _i15.HiveModule {}
