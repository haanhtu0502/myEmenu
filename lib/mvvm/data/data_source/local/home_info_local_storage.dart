import 'package:emenu/mvvm/data/model/home_info/home_info_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeInfoLocalStorage {
  final Box<HomeInfoStorage> _hive;

  HomeInfoLocalStorage(this._hive);

  Future<void> saveOrg(HomeInfoStorage newInfo) async {
    final listInfo = _hive.values.toList();
    if (listInfo.isEmpty) {
      await _hive.add(newInfo);
    } else {
      final info = listInfo.first;
      await _hive.putAt(
          0,
          info
            ..orgId = newInfo.orgId
            ..tenantId = newInfo.tenantId
            ..posTerminalId = newInfo.posTerminalId
            ..floorId = newInfo.floorId
            ..tableId = newInfo.tableId
            ..tableNo = newInfo.tableNo
            ..floorNo = newInfo.floorNo
            ..priceListId = newInfo.priceListId);
    }
  }

  HomeInfoStorage? getHomeInfo() {
    final listInfo = _hive.values.toList();
    if (listInfo.isEmpty) {
      return null;
    } else {
      final info = listInfo.first;
      return info;
    }
  }

  List<HomeInfoStorage>? getHomeInfoList() {
    final listInfo = _hive.values.toList();
    if (listInfo.isEmpty) {
      return null;
    } else {
      return listInfo;
    }
  }

  Future<void> deleteInfo() async {
    final listInfo = _hive.values.toList();
    if (listInfo.isNotEmpty) {
      await _hive.deleteAt(0);
    }
  }

  Future<void> updateInfo({
    int? orgId,
    int? tenantId,
    int? posTerminalId,
    int? tableId,
    int? floorId,
    String? tableNo,
    String? floorNo,
    int? priceListId,
  }) async {
    final listInfo = _hive.values.toList();
    if (listInfo.isNotEmpty) {
      final info = listInfo.first;
      await _hive.putAt(
          0,
          info
            ..orgId = orgId ?? info.orgId
            ..tenantId = tenantId ?? info.tenantId
            ..posTerminalId = posTerminalId ?? info.posTerminalId
            ..floorId = floorId ?? info.floorId
            ..tableId = tableId ?? info.tableId
            ..tableNo = tableNo ?? info.tableNo
            ..floorNo = floorNo ?? info.floorNo
            ..priceListId = priceListId ?? info.priceListId);
    } else {
      saveOrg(
        HomeInfoStorage(
          orgId: orgId,
          tenantId: tenantId,
          posTerminalId: posTerminalId,
          floorId: floorId,
          tableId: tableId,
          tableNo: tableNo,
          floorNo: floorNo,
          priceListId: priceListId,
        ),
      );
    }
  }

  Future<void> clearCache() async {
    await _hive.clear();
  }
}
