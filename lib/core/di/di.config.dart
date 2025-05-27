// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i14;
import 'package:hive_flutter/hive_flutter.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

import '../../mvvm/data/data_source/local/home_info_local_storage.dart' as _i13;
import '../../mvvm/data/data_source/remote/config/emenu_config_api.dart' as _i5;
import '../../mvvm/data/data_source/remote/product_category.dart/product_category_api.dart'
    as _i8;
import '../../mvvm/data/data_source/remote/token/token_api.dart' as _i10;
import '../../mvvm/data/model/home_info/home_info_storage.dart' as _i12;
import '../../mvvm/repository/auth_repositories.dart' as _i11;
import '../../mvvm/repository/emenu_config_repositories.dart' as _i6;
import '../../mvvm/repository/product_category_repositories.dart' as _i9;
import '../../mvvm/viewmodel/app_provider.dart' as _i3;
import '../../mvvm/viewmodel/home/home_provider.dart' as _i15;
import '../../mvvm/viewmodel/list_product/list_product_provider.dart' as _i16;
import 'module/data_source_module.dart' as _i17;
import 'module/hive_module.dart' as _i18;

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
  gh.factory<_i3.AppProvider>(() => _i3.AppProvider());
  gh.factory<_i4.Dio>(
    () => dataSourceModule.dioProd(),
    registerFor: {_prod},
  );
  gh.factory<_i4.Dio>(
    () => dataSourceModule.dioDev(),
    registerFor: {_dev},
  );
  gh.factory<_i5.EmenuConfigApi>(() => _i5.EmenuConfigApi(gh<_i4.Dio>()));
  gh.factory<_i6.EmenuConfigRepositories>(
      () => _i6.EmenuConfigRepositories(gh<_i5.EmenuConfigApi>()));
  await gh.singletonAsync<_i7.HiveInterface>(
    () => hiveModule.init(),
    preResolve: true,
  );
  gh.factory<_i8.ProductCategoryApi>(
      () => _i8.ProductCategoryApi(gh<_i4.Dio>()));
  gh.factory<_i9.ProductCategoryRepositories>(
      () => _i9.ProductCategoryRepositories(gh<_i8.ProductCategoryApi>()));
  gh.factory<_i10.TokenApi>(() => _i10.TokenApi(gh<_i4.Dio>()));
  gh.factory<_i11.AuthRepositories>(
      () => _i11.AuthRepositories(gh<_i10.TokenApi>()));
  gh.singleton<_i7.Box<_i12.HomeInfoStorage>>(
      () => hiveModule.homeInfoBox(gh<_i7.HiveInterface>()));
  gh.factory<_i13.HomeInfoLocalStorage>(
      () => _i13.HomeInfoLocalStorage(gh<_i14.Box<_i12.HomeInfoStorage>>()));
  gh.factoryParam<_i15.HomeProvider, String?, _i3.AppProvider>((
    hashParam,
    _appProvider,
  ) =>
      _i15.HomeProvider(
        hashParam,
        _appProvider,
        gh<_i11.AuthRepositories>(),
        gh<_i6.EmenuConfigRepositories>(),
        gh<_i9.ProductCategoryRepositories>(),
      ));
  gh.factory<_i16.ListProductProvider>(
      () => _i16.ListProductProvider(gh<_i9.ProductCategoryRepositories>()));
  return getIt;
}

class _$DataSourceModule extends _i17.DataSourceModule {}

class _$HiveModule extends _i18.HiveModule {}
