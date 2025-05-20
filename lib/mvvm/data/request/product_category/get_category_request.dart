class GetCategoryRequest {
  int? page;
  int? pageSize;
  int? tenantId;
  int? orgId;
  int? posTerminalId;
  String? isMenu;

  GetCategoryRequest({
    this.page,
    this.pageSize,
    this.tenantId,
    this.orgId,
    this.posTerminalId,
    this.isMenu,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'tenantId': tenantId,
      'orgId': orgId,
      'posTerminalId': posTerminalId,
      'isMenu': isMenu,
    };
  }
}
