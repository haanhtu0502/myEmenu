enum HomeViewStatus {
  idle,
  loading,
  success,
  getCustomerInfomationSuccess,
  loadingGetCategroy,
  loadingInitial,
  getCategorySuccess,
  initialSuccess,
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
  const HomeViewState.loadingGetCategroy()
      : this._(HomeViewStatus.loadingGetCategroy);
  const HomeViewState.loadingInitial() : this._(HomeViewStatus.loadingInitial);
  const HomeViewState.initialSuccess([String? message])
      : this._(HomeViewStatus.initialSuccess, message);
  const HomeViewState.getCategorySuccess([String? message])
      : this._(HomeViewStatus.getCategorySuccess, message);

  bool get isIdle => status == HomeViewStatus.idle;
  bool get isLoading => status == HomeViewStatus.loading;
  bool get isSuccess => status == HomeViewStatus.success;
  bool get isError => status == HomeViewStatus.error;
  bool get isGetCustomerInfomationSuccess =>
      status == HomeViewStatus.getCustomerInfomationSuccess;
  bool get isLoadingGetCategroy => status == HomeViewStatus.loadingGetCategroy;
  bool get isGetCategorySuccess => status == HomeViewStatus.getCategorySuccess;
  bool get isLoadingInitial => status == HomeViewStatus.loadingInitial;
  bool get isInitialSuccess => status == HomeViewStatus.initialSuccess;
}
