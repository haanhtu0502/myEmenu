import 'package:dio/dio.dart';
import 'package:emenu/core/configurations/configuration.dart';
import 'package:injectable/injectable.dart';

import '../../app_core_factory.dart';

@module
abstract class DataSourceModule {
  @prod
  Dio dioProd() => AppCoreFactory.createDio(Configurations.baseUrl);

  @dev
  Dio dioDev() => AppCoreFactory.createDio(Configurations.baseUrl);
}
