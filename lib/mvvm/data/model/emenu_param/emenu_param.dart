class EmenuParam {
  int? tenantId;
  int? orgId;
  int? tableId;
  int? floorId;
  int? posTerminalId;
  String? tableNo;
  String? floorNo;
  int? priceListId;

  EmenuParam({
    this.tenantId,
    this.orgId,
    this.tableId,
    this.floorId,
    this.posTerminalId,
    this.tableNo,
    this.floorNo,
    this.priceListId,
  });

  EmenuParam copyWith({
    int? tenantId,
    int? orgId,
    int? tableId,
    int? floorId,
    int? posTerminalId,
    String? tableNo,
    String? floorNo,
    int? priceListId,
  }) {
    return EmenuParam(
      tenantId: tenantId ?? this.tenantId,
      orgId: orgId ?? this.orgId,
      tableId: tableId ?? this.tableId,
      floorId: floorId ?? this.floorId,
      posTerminalId: posTerminalId ?? this.posTerminalId,
      tableNo: tableNo ?? this.tableNo,
      floorNo: floorNo ?? this.floorNo,
      priceListId: priceListId ?? this.priceListId,
    );
  }

  factory EmenuParam.fromJson(Map<String, dynamic> json) {
    return EmenuParam(
      tenantId: json['tenantId'] as int?,
      orgId: json['orgId'] as int?,
      tableId: json['tableId'] as int?,
      floorId: json['floorId'] as int?,
      posTerminalId: json['posTerminalId'] as int?,
      tableNo: json['tableNo'] as String?,
      floorNo: json['floorNo'] as String?,
      priceListId: json['priceListId'] as int?,
    );
  }
}
