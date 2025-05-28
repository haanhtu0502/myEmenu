class GetProductRequest {
  int page;
  int pageSize;
  int tenantId;
  int orgId;
  int posTerminalId;
  int? productCategoryId;
  String? name;

  GetProductRequest({
    required this.page,
    required this.pageSize,
    required this.tenantId,
    required this.orgId,
    required this.posTerminalId,
    this.productCategoryId,
    this.name,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map = {
      'page': page,
      'pageSize': pageSize,
      'tenantId': tenantId,
      'orgId': orgId,
      'posTerminalId': posTerminalId,
    };
    if (productCategoryId != null) {
      map['productCategoryId'] = productCategoryId;
    }
    if (name != null) {
      map['name'] = name;
    }

    return map;
  }
}
