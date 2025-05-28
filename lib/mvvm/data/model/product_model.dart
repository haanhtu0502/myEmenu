import 'package:emenu/mvvm/data/model/product_component/product_component.dart';

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
  List<ProductComponent>? components;
  List<ProductComponent>? extraItems;

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
    this.components,
    this.extraItems,
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
    components = (json['components'] as List?)
        ?.map((e) => ProductComponent.fromJson(e))
        .toList();
    extraItems = (json['extraItems'] as List?)
        ?.map((e) => ProductComponent.fromJson(e))
        .toList();
  }
}

extension ProductModelExtension on ProductModel {
  num getTotalPrice(int qty) {
    final basePrice = extraItems?.fold(
          salesPrice ?? 0,
          (sum, extra) =>
              (sum) + (extra.quantity ?? 0) * (extra.salePrice ?? 0),
        ) ??
        (salesPrice ?? 0);

    return basePrice * qty;
  }
}
