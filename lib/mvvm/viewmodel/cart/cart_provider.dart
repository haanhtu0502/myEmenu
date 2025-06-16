import 'package:emenu/mvvm/data/model/product_cart_item/product_cart_item_model.dart';
import 'package:emenu/mvvm/data/model/request_history/request_history_model.dart';
import 'package:emenu/mvvm/data/request/create_order_request.dart';
import 'package:emenu/mvvm/data/request/get_request_history_request.dart';
import 'package:emenu/mvvm/repository/cart_repositories.dart';
import 'package:emenu/mvvm/viewmodel/app_provider.dart';
import 'package:emenu/mvvm/viewmodel/cart/view_state/cart_view_state.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:flutter/material.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
@singleton
class CartProvider extends ChangeNotifier {
  final List<ProductCartItemModel> cartItems = [];
  List<RequestHistoryModel> listRequestHistory = [];

  num totalPrice = 0;

  final CartRepositories _cartRepositories;

  CartViewState _cartViewState = const CartViewState.initial();

  CartViewState get cartViewState => _cartViewState;

  CartProvider(
    this._cartRepositories,
  );

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
        cartItems[index].totalPrice =
            productCart.product.getTotalPrice(quantity);
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

  Future<void> getRequestHistory(String? cusPhone) async {
    _cartViewState = const CartViewState.loadingGetRequestHistory();
    notifyListeners();
    final result =
        await _cartRepositories.getRequestHistory(GetRequestHistoryRequest(
      orgId: AppInformation().orgId,
      cusPhone: cusPhone,
      tableId: AppInformation().tableId,
    ));
    result.fold(
      (left) {
        _cartViewState = CartViewState.getRequestHistoryFailed(left.message);
        notifyListeners();
      },
      (right) {
        listRequestHistory = right.data ?? [];
        _cartViewState = const CartViewState.getRequestHistorySuccess();
        notifyListeners();
      },
    );
  }

  num getTotalHistoryPrice() {
    return listRequestHistory.fold(
        0, (sum, item) => sum + (item.salesPrice ?? 0));
  }

  Future<void> sendRequestOrder({required AppProvider appProvider}) async {
    _cartViewState = const CartViewState.loadingSendRequestOrder();
    notifyListeners();
    final result = await _cartRepositories.saveRequestOrder(CreateOrderRequest(
      orgId: AppInformation().orgId!,
      priceListId: AppInformation().priceListId!,
      cusName: appProvider.customerName ?? '',
      cusPhone: appProvider.customerPhone ?? '',
      orderTime: DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()),
      floorId: AppInformation().floorId!,
      tableId: AppInformation().tableId!,
      requestOrderLineDto: cartItems.map((item) {
        return OrderLine(
          orgId: AppInformation().orgId!,
          productId: item.product.productId!,
          qty: item.quantity,
          salePrice: (item.product.salesPrice ?? 0).toDouble(),
          totalAmount: item.totalPrice.toDouble(),
          taxId: item.product.taxId,
          description: item.note,
        );
      }).toList(),
      posTerminalId: AppInformation().posTerminalId!,
    ));
    result.fold(
      (left) {
        _cartViewState = CartViewState.sendRequestOrderFailed(left.message);
        notifyListeners();
      },
      (right) {
        _cartViewState = CartViewState.sendRequestOrderSuccess(
          right.message,
        );
        clearCart();
        notifyListeners();
      },
    );
  }
}
