import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailProvider extends ChangeNotifier {
  ProductModel product;
  int quantity = 1;
  String note = '';

  ProductDetailProvider({
    @factoryParam required this.product,
  }) {
    product = product;
  }

  void changeQuantityProductExtra({required int id, required int value}) {
    if (value < 0) {
      return;
    }
    product.extraItems = product.extraItems?.map((extra) {
      if (extra.id == id) {
        extra.quantity = value;
      }
      return extra;
    }).toList();

    notifyListeners();
  }

  void changeQuantity(int value) {
    if (value < 1) {
      return;
    }
    quantity = value;
    notifyListeners();
  }
}
