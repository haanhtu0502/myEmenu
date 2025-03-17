// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_info_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeInfoStorageAdapter extends TypeAdapter<HomeInfoStorage> {
  @override
  final int typeId = 1;

  @override
  HomeInfoStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeInfoStorage(
      orgId: fields[0] as int?,
      tenantId: fields[1] as int?,
      tableId: fields[2] as int?,
      floorId: fields[3] as int?,
      posTerminalId: fields[4] as int?,
      tableNo: fields[5] as String?,
      floorNo: fields[6] as String?,
      priceListId: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeInfoStorage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.orgId)
      ..writeByte(1)
      ..write(obj.tenantId)
      ..writeByte(2)
      ..write(obj.tableId)
      ..writeByte(3)
      ..write(obj.floorId)
      ..writeByte(4)
      ..write(obj.posTerminalId)
      ..writeByte(5)
      ..write(obj.tableNo)
      ..writeByte(6)
      ..write(obj.floorNo)
      ..writeByte(7)
      ..write(obj.priceListId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeInfoStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
