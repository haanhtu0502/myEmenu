class ProductComponent {
  int id;
  String? code;
  String? name;
  num? salePrice;
  num? costPrice;
  int? taxId;
  int? uomId;
  String? uomCode;
  String? uomName;
  String? taxName;
  num? taxRate;
  int? quantity;

  ProductComponent({
    required this.id,
    this.code,
    this.name,
    this.salePrice,
    this.costPrice,
    this.taxId,
    this.uomId,
    this.uomCode,
    this.uomName,
    this.taxName,
    this.taxRate,
    this.quantity,
  });

  ProductComponent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        code = json['code'],
        name = json['name'],
        salePrice = json['saleprice'],
        costPrice = json['costprice'],
        taxId = json['taxId'],
        uomId = json['uomId'],
        uomCode = json['uomCode'],
        uomName = json['uomName'],
        taxName = json['taxName'],
        taxRate = json['taxRate'],
        quantity = json['qty'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'salePrince': salePrice,
      'costPrice': costPrice,
      'taxId': taxId,
      'uomId': uomId,
      'uomCode': uomCode,
      'uomName': uomName,
      'taxName': taxName,
      'taxRate': taxRate,
      'qty': quantity,
    };
  }
}
