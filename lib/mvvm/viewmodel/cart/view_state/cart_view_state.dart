enum CartViewStatus {
  initial,
  loadingSendRequestOrder,
  sendRequestOrderSuccess,
  sendRequestOrderFailed,
  loadingGetRequestHistory,
  getRequestHistorySuccess,
  getRequestHistoryFailed,
  loadingSendNotifyRemind,
  sendRequestOrderRemindSuccess,
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
  const CartViewState.sendRequestOrderFailed([String? message])
      : this._(CartViewStatus.sendRequestOrderFailed, message);
  const CartViewState.loadingGetRequestHistory()
      : this._(CartViewStatus.loadingGetRequestHistory);
  const CartViewState.getRequestHistorySuccess([String? message])
      : this._(CartViewStatus.getRequestHistorySuccess, message);
  const CartViewState.getRequestHistoryFailed([String? message])
      : this._(CartViewStatus.getRequestHistoryFailed, message);
  const CartViewState.loadingSendNotifyRemind()
      : this._(CartViewStatus.loadingSendNotifyRemind);
  const CartViewState.sendRequestOrderRemindSuccess([String? message])
      : this._(CartViewStatus.sendRequestOrderRemindSuccess, message);
  const CartViewState.error(String message)
      : this._(CartViewStatus.error, message);

  bool get isInitial => state == CartViewStatus.initial;
  bool get isLoadingSendRequestOrder =>
      state == CartViewStatus.loadingSendRequestOrder;
  bool get isSendRequestOrderSuccess =>
      state == CartViewStatus.sendRequestOrderSuccess;
  bool get isError => state == CartViewStatus.error;
  bool get isSendRequestOrderFailed =>
      state == CartViewStatus.sendRequestOrderFailed;
  bool get isLoadingGetRequestHistory =>
      state == CartViewStatus.loadingGetRequestHistory;
  bool get isGetRequestHistorySuccess =>
      state == CartViewStatus.getRequestHistorySuccess;
  bool get isGetRequestHistoryFailed =>
      state == CartViewStatus.getRequestHistoryFailed;
  bool get isLoadingSendNotifyRemind =>
      state == CartViewStatus.loadingSendNotifyRemind;
  bool get isSendRequestOrderRemindSuccess =>
      state == CartViewStatus.sendRequestOrderRemindSuccess;
}
