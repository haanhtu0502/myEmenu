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
  num? quantity;

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

  ProductComponent copyWith({
    int? id,
    String? code,
    String? name,
    num? salePrice,
    num? costPrice,
    int? taxId,
    int? uomId,
    String? uomCode,
    String? uomName,
    String? taxName,
    num? taxRate,
    int? quantity,
  }) {
    return ProductComponent(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      salePrice: salePrice ?? this.salePrice,
      costPrice: costPrice ?? this.costPrice,
      taxId: taxId ?? this.taxId,
      uomId: uomId ?? this.uomId,
      uomCode: uomCode ?? this.uomCode,
      uomName: uomName ?? this.uomName,
      taxName: taxName ?? this.taxName,
      taxRate: taxRate ?? this.taxRate,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductComponent &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.salePrice == salePrice &&
        other.costPrice == costPrice &&
        other.taxId == taxId &&
        other.uomId == uomId &&
        other.uomCode == uomCode &&
        other.uomName == uomName &&
        other.taxName == taxName &&
        other.taxRate == taxRate &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        name.hashCode ^
        salePrice.hashCode ^
        costPrice.hashCode ^
        taxId.hashCode ^
        uomId.hashCode ^
        uomCode.hashCode ^
        uomName.hashCode ^
        taxName.hashCode ^
        taxRate.hashCode ^
        quantity.hashCode;
  }
}
