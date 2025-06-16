class SendNotificationRequest {
  String? notifyType;
  int? tableId;
  int? floorId;
  int? orgId;
  int? posTerminalId;
  int? posOrderId;

  SendNotificationRequest({
    this.notifyType,
    this.tableId,
    this.floorId,
    this.orgId,
    this.posTerminalId,
    this.posOrderId,
  });

  Map<String, dynamic> toJson() {
    return {
      'notifyType': notifyType,
      'tableId': tableId,
      'floorId': floorId,
      'orgId': orgId,
      'posTerminalId': posTerminalId,
      'posOrderId': posOrderId,
    };
  }
}
