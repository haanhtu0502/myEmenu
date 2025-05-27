class GetProductRequest {
  int page;
  int pageSize;
  int tenantId;
  int orgId;
  int posTerminalId;
  int productCategoryId;

  GetProductRequest({
    required this.page,
    required this.pageSize,
    required this.tenantId,
    required this.orgId,
    required this.posTerminalId,
    required this.productCategoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'tenantId': tenantId,
      'orgId': orgId,
      'posTerminalId': posTerminalId,
      'productCategoryId': productCategoryId,
    };
  }
}
