enum ViewStatus { idle, loading, success, error }

class ViewState {
  final ViewStatus status;
  final String? message;

  const ViewState._(this.status, [this.message]);

  const ViewState.idle() : this._(ViewStatus.idle);
  const ViewState.loading() : this._(ViewStatus.loading);
  const ViewState.success([String? message])
      : this._(ViewStatus.success, message);
  const ViewState.error(String message) : this._(ViewStatus.error, message);

  bool get isIdle => status == ViewStatus.idle;
  bool get isLoading => status == ViewStatus.loading;
  bool get isSuccess => status == ViewStatus.success;
  bool get isError => status == ViewStatus.error;
}
