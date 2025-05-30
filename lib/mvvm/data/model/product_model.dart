import 'package:emenu/mvvm/data/model/product_component/product_component.dart';
import 'package:collection/collection.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    final listEquals = const DeepCollectionEquality().equals;

    return other is ProductModel &&
        other.productId == productId &&
        other.orgId == orgId &&
        other.productCategoryId == productCategoryId &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.posTerminalId == posTerminalId &&
        other.salesPrice == salesPrice &&
        other.isActive == isActive &&
        other.taxId == taxId &&
        other.description == description &&
        listEquals(other.components, components) &&
        listEquals(other.extraItems, extraItems);
  }

  @override
  int get hashCode {
    final listHash = const DeepCollectionEquality().hash;

    return Object.hash(
      productId,
      orgId,
      productCategoryId,
      name,
      imageUrl,
      posTerminalId,
      salesPrice,
      isActive,
      taxId,
      description,
      listHash(components),
      listHash(extraItems),
    );
  }

  ProductModel copyWith({
    int? productId,
    int? orgId,
    int? productCategoryId,
    String? name,
    String? imageUrl,
    int? posTerminalId,
    num? salesPrice,
    String? isActive,
    int? taxId,
    String? description,
    List<ProductComponent>? components,
    List<ProductComponent>? extraItems,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      orgId: orgId ?? this.orgId,
      productCategoryId: productCategoryId ?? this.productCategoryId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      posTerminalId: posTerminalId ?? this.posTerminalId,
      salesPrice: salesPrice ?? this.salesPrice,
      isActive: isActive ?? this.isActive,
      taxId: taxId ?? this.taxId,
      description: description ?? this.description,
      components:
          components ?? this.components?.map((e) => e.copyWith()).toList(),
      extraItems:
          extraItems ?? this.extraItems?.map((e) => e.copyWith()).toList(),
    );
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
