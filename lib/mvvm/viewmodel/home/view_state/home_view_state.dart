enum HomeViewStatus {
  idle,
  loading,
  success,
  getCustomerInfomationSuccess,
  error,
}

class HomeViewState {
  final HomeViewStatus status;
  final String? message;

  const HomeViewState._(this.status, [this.message]);

  const HomeViewState.idle() : this._(HomeViewStatus.idle);
  const HomeViewState.loading() : this._(HomeViewStatus.loading);
  const HomeViewState.success([String? message])
      : this._(HomeViewStatus.success, message);
  const HomeViewState.getCustomerInfomationSuccess([String? message])
      : this._(HomeViewStatus.getCustomerInfomationSuccess, message);
  const HomeViewState.error(String message)
      : this._(HomeViewStatus.error, message);

  bool get isIdle => status == HomeViewStatus.idle;
  bool get isLoading => status == HomeViewStatus.loading;
  bool get isSuccess => status == HomeViewStatus.success;
  bool get isError => status == HomeViewStatus.error;
}
