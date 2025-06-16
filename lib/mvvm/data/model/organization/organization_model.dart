// "isActive": "Y",
//         "id": 1000057,
//         "tableNo": "HK12",
//         "name": "HK 12",
//         "description": null,
//         "floor": {
//             "isActive": "Y",
//             "id": 1000031,
//             "floorNo": null,
//             "name": "Shoptel_Lô 6 (HK10 - HK21)",
//             "description": null,
//             "orgId": null,
//             "qtyTables": null,
//             "displayIndex": null,
//             "posTerminalId": null,
//             "erpFloorId": null
//         },
//         "tableStatus": "TIU",
//         "displayIndex": null,
//         "numberSeats": 3,
//         "orgId": 1000075,
//         "posOrderId": null,
//         "isBuffet": "N",
//         "isRoom": "N",
//         "numberGuests": 0,
//         "erpTableId": 1000118,
//         "isLocked": "N",
//         "customerName": null,
//         "orderGuest": null

class OrganizationModel {
  final int? id;
  final String? name;
  final String? tableNo;
  final String? description;
  final String? isActive;
  final String? isBuffet;
  final String? isRoom;
  final String? isLocked;
  final String? tableStatus;
  final int? numberSeats;
  final int? numberGuests;
  final int? orgId;
  final int? posOrderId;
  final int? erpTableId;
  final String? customerName;
  final String? orderGuest;

  OrganizationModel({
    this.id,
    this.name,
    this.tableNo,
    this.description,
    this.isActive,
    this.isBuffet,
    this.isRoom,
    this.isLocked,
    this.tableStatus,
    this.numberSeats,
    this.numberGuests,
    this.orgId,
    this.posOrderId,
    this.erpTableId,
    this.customerName,
    this.orderGuest,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) {
    return OrganizationModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      tableNo: json['tableNo'] as String?,
      description: json['description'] as String?,
      isActive: json['isActive'] as String?,
      isBuffet: json['isBuffet'] as String?,
      isRoom: json['isRoom'] as String?,
      isLocked: json['isLocked'] as String?,
      tableStatus: json['tableStatus'] as String?,
      numberSeats: json['numberSeats'] as int?,
      numberGuests: json['numberGuests'] as int?,
      orgId: json['orgId'] as int?,
      posOrderId: json['posOrderId'] as int?,
      erpTableId: json['erpTableId'] as int?,
      customerName: json['customerName'] as String?,
      orderGuest: json['orderGuest'] as String?,
    );
  }
}
