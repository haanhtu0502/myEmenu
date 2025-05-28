import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> cartItems = [];
  num totalPrice = 0;

  CartProvider();

  void addToCart(ProductModel product) {
    cartItems.add(product);
    totalPrice += product.salesPrice ?? 0;
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    totalPrice -= product.salesPrice ?? 0;
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    totalPrice = 0;
    notifyListeners();
  }
}
