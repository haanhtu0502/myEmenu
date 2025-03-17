class GetTokenRequest {
  final String userName;
  final String passWord;
  final int dTenantId;
  final int dOrgId;
  final String language;

  GetTokenRequest({
    required this.userName,
    required this.passWord,
    required this.dTenantId,
    required this.dOrgId,
    required this.language,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "password": passWord,
      'd_tenant_id': dTenantId,
      'd_org_id': dOrgId,
      'language': language,
    };
  }
}
