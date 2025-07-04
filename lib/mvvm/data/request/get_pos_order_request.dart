class GetPosOrderRequest {
  int page;
  int pageSize;
  int tableId;
  int floorId;
  int orgId;

  GetPosOrderRequest({
    required this.page,
    required this.pageSize,
    required this.tableId,
    required this.floorId,
    required this.orgId,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'tableId': tableId,
      'floorId': floorId,
      'orderStatus': 'DRA',
      'orgId': orgId,
    };
  }
}
