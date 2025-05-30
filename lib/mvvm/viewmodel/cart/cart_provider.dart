import 'package:emenu/mvvm/data/model/product_cart_item/product_cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class CartProvider extends ChangeNotifier {
  final List<ProductCartItemModel> cartItems = [];
  num totalPrice = 0;

  CartProvider();

  void addToCart(ProductCartItemModel productCart) {
    final int index = cartItems.indexWhere((item) => item == productCart);
    if (index != -1) {
      // If the productCart already exists in the cart, update the quantity and total price
      cartItems[index].quantity += productCart.quantity;
      cartItems[index].totalPrice += productCart.totalPrice;
      notifyListeners();
      return;
    } else {
      // If the productCart does not exist in the cart, add it
      cartItems.add(productCart);
      notifyListeners();
    }
    totalPrice += productCart.totalPrice;
    notifyListeners();
  }

  void removeFromCart(ProductCartItemModel productCart) {
    cartItems.remove(productCart);
    totalPrice -= productCart.totalPrice;
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    totalPrice = 0;
    notifyListeners();
  }

  void updateCartItemQuantity(ProductCartItemModel productCart, int quantity) {
    final int index = cartItems.indexWhere((item) => item == productCart);
    if (index != -1) {
      if (quantity <= 0) {
        // cartItems.removeAt(index);
        return;
      } else {
        // Update the quantity and total price of the item
        cartItems[index].quantity = quantity;
        cartItems[index].totalPrice = productCart.totalPrice * quantity;
      }
      notifyListeners();
    }
  }

  void updateCartItemNote(ProductCartItemModel productCart, String note) {
    final int index = cartItems.indexWhere((item) => item == productCart);
    if (index != -1) {
      // Update the note of the item
      cartItems[index].note = note;
      notifyListeners();
    }
  }
}
