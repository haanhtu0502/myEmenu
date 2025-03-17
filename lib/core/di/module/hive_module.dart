import 'package:emenu/core/design_system/resource/hive_constant.dart';
import 'package:emenu/mvvm/data/model/home_info/home_info_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  @preResolve
  @singleton
  Future<HiveInterface> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HomeInfoStorageAdapter());

    await Hive.openBox<HomeInfoStorage>(HiveConstant.homeInfoBox);

    return Hive;
  }

  @Singleton()
  Box<HomeInfoStorage> homeInfoBox(HiveInterface hive) {
    return hive.box(HiveConstant.homeInfoBox);
  }
}
