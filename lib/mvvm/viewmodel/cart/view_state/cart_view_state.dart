enum CartViewStatus {
  initial,
  loadingSendRequestOrder,
  sendRequestOrderSuccess,
  error,
}

class CartViewState {
  final CartViewStatus state;
  final String? message;

  const CartViewState._(this.state, [this.message]);

  const CartViewState.initial() : this._(CartViewStatus.initial);
  const CartViewState.loadingSendRequestOrder()
      : this._(CartViewStatus.loadingSendRequestOrder);
  const CartViewState.sendRequestOrderSuccess([String? message])
      : this._(CartViewStatus.sendRequestOrderSuccess, message);
  const CartViewState.error(String message)
      : this._(CartViewStatus.error, message);

  bool get isInitial => state == CartViewStatus.initial;
  bool get isLoadingSendRequestOrder =>
      state == CartViewStatus.loadingSendRequestOrder;
  bool get isSendRequestOrderSuccess =>
      state == CartViewStatus.sendRequestOrderSuccess;
  bool get isError => state == CartViewStatus.error;
}
