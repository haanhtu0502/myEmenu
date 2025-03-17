import 'package:emenu/core/design_system/resource/hive_constant.dart';
import 'package:hive/hive.dart';

part 'home_info_storage.g.dart';

@HiveType(typeId: HiveConstant.homeInfoBoxId)
class HomeInfoStorage {
  @HiveField(0)
  int? orgId;

  @HiveField(1)
  int? tenantId;

  @HiveField(2)
  int? tableId;

  @HiveField(3)
  int? floorId;

  @HiveField(4)
  int? posTerminalId;

  @HiveField(5)
  String? tableNo;

  @HiveField(6)
  String? floorNo;

  @HiveField(7)
  int? priceListId;

  HomeInfoStorage({
    this.orgId,
    this.tenantId,
    this.tableId,
    this.floorId,
    this.posTerminalId,
    this.tableNo,
    this.floorNo,
    this.priceListId,
  });
}
