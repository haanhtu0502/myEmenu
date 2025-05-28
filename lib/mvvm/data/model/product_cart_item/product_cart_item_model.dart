import 'package:emenu/mvvm/data/model/product_model.dart';

class ProductCartItemModel {
  final ProductModel product;
  final int quantity;
  final String note;
  final num totalPrice;

  ProductCartItemModel({
    required this.product,
    required this.quantity,
    required this.note,
    required this.totalPrice,
  });
}
