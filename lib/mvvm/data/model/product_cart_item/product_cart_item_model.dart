import 'package:emenu/mvvm/data/model/product_model.dart';

class ProductCartItemModel {
  ProductModel product;
  int quantity;
  String note;
  num totalPrice;

  ProductCartItemModel({
    required this.product,
    required this.quantity,
    required this.note,
    required this.totalPrice,
  });

  ProductCartItemModel copyWith({
    ProductModel? product,
    int? quantity,
    String? note,
    num? totalPrice,
  }) {
    return ProductCartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCartItemModel &&
        other.product == product &&
        other.note == note;
  }
}
