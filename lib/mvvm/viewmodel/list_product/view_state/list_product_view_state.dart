enum ListProductViewStatus {
  idle,
  loadingGetCategory,
  getCategorySuccess,
  loadingGetProductByCategory,
  getProductByCategorySuccess,
  loadingGetProductBySearch,
  getProductBySearchSuccess,
  loadingGetMoreProductByCategory,
  getMoreProductByCategorySuccess,
  error,
}

class ListProductViewState {
  final ListProductViewStatus status;
  final String? message;

  const ListProductViewState._(this.status, [this.message]);

  const ListProductViewState.idle() : this._(ListProductViewStatus.idle);
  const ListProductViewState.loadingGetCategory()
      : this._(ListProductViewStatus.loadingGetCategory);
  const ListProductViewState.getCategorySuccess([String? message])
      : this._(ListProductViewStatus.getCategorySuccess, message);
  const ListProductViewState.loadingGetProductByCategory()
      : this._(ListProductViewStatus.loadingGetProductByCategory);
  const ListProductViewState.getProductByCategorySuccess([String? message])
      : this._(ListProductViewStatus.getProductByCategorySuccess, message);
  const ListProductViewState.loadingGetProductBySearch()
      : this._(ListProductViewStatus.loadingGetProductBySearch);
  const ListProductViewState.getProductBySearchSuccess([String? message])
      : this._(ListProductViewStatus.getProductBySearchSuccess, message);
  const ListProductViewState.loadingGetMoreProductByCategory()
      : this._(ListProductViewStatus.loadingGetMoreProductByCategory);
  const ListProductViewState.getMoreProductByCategorySuccess([String? message])
      : this._(ListProductViewStatus.getMoreProductByCategorySuccess, message);
  const ListProductViewState.error(String message)
      : this._(ListProductViewStatus.error, message);

  bool get isIdle => status == ListProductViewStatus.idle;
  bool get isError => status == ListProductViewStatus.error;
  bool get isLoadingGetCategory =>
      status == ListProductViewStatus.loadingGetCategory;
  bool get isGetCategorySuccess =>
      status == ListProductViewStatus.getCategorySuccess;
  bool get isLoadingGetProductByCategory =>
      status == ListProductViewStatus.loadingGetProductByCategory;
  bool get isGetProductByCategorySuccess =>
      status == ListProductViewStatus.getProductByCategorySuccess;
  bool get isLoadingGetProductBySearch =>
      status == ListProductViewStatus.loadingGetProductBySearch;
  bool get isGetProductBySearchSuccess =>
      status == ListProductViewStatus.getProductBySearchSuccess;
  bool get isLoadingGetMoreProductByCategory =>
      status == ListProductViewStatus.loadingGetMoreProductByCategory;
  bool get isGetMoreProductByCategorySuccess =>
      status == ListProductViewStatus.getMoreProductByCategorySuccess;
}
