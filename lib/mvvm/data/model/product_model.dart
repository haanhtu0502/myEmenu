class ProductModel {
  int? productId;
  int? orgId;
  int? productCategoryId;
  String? name;
  String? imageUrl;
  int? posTerminalId;
  num? salesPrice;
  String? isActive;
  int? taxId;
  String? description;

  ProductModel({
    this.productId,
    this.orgId,
    this.productCategoryId,
    this.name,
    this.imageUrl,
    this.posTerminalId,
    this.salesPrice,
    this.isActive,
    this.taxId,
    this.description,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    orgId = json['orgId'];
    productCategoryId = json['productCategoryId'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    posTerminalId = json['posTerminalId'];
    salesPrice = json['salesPrice'];
    isActive = json['isActive'];
    taxId = json['taxId'];
    description = json['description'];
  }
}
