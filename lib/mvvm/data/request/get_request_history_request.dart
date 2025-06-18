class GetRequestHistoryRequest {
  final int? orgId;
  final String? cusPhone;
  final int? tableId;
  final int? floorId;

  GetRequestHistoryRequest({
    this.orgId,
    this.cusPhone,
    this.tableId,
    this.floorId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (orgId != null) {
      data['orgId'] = orgId;
    }
    if (cusPhone != null && cusPhone!.isNotEmpty) {
      data['cusPhone'] = cusPhone;
    }
    if (tableId != null) {
      data['tableId'] = tableId;
    }
    if (floorId != null) {
      data['floorId'] = floorId;
    }
    return data;
  }
}
