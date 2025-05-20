class GetPosOrderRequest {
  int page;
  int pageSize;
  int tableId;
  int floorId;

  GetPosOrderRequest({
    required this.page,
    required this.pageSize,
    required this.tableId,
    required this.floorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'tableId': tableId,
      'floorId': floorId,
      'orderStatus': 'DRA',
    };
  }
}
