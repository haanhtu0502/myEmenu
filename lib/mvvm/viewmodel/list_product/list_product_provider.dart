import 'package:emenu/mvvm/data/model/category_product_model.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:emenu/mvvm/data/request/product_category/get_category_request.dart';
import 'package:emenu/mvvm/data/request/product_category/get_product_request.dart';
import 'package:emenu/mvvm/repository/product_category_repositories.dart';
import 'package:emenu/mvvm/viewmodel/home/data_class/app_information.dart';
import 'package:emenu/mvvm/viewmodel/list_product/view_state/list_product_view_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListProductProvider extends ChangeNotifier {
  List<CategoryProductModel> listCategoryProduct = [];
  final ProductCategoryRepositories _productCategoryRepositories;

  ListProductViewState _state = const ListProductViewState.idle();
  ListProductViewState get state => _state;

  ListProductProvider(
    this._productCategoryRepositories,
  );

  Future<void> initData() async {
    await getCategory();
    await fetchAllProductsByCategories();
  }

  Future<void> getCategory() async {
    _state = const ListProductViewState.loadingGetCategory();
    final result = await _productCategoryRepositories.getCategory(
      request: GetCategoryRequest(
        page: 0,
        pageSize: 100,
        tenantId: AppInformation().tenantId ?? 0,
        orgId: AppInformation().orgId ?? 0,
        posTerminalId: AppInformation().posTerminalId ?? 0,
      ),
    );

    result.fold(
      (l) {
        _state = ListProductViewState.error(l.message);
        notifyListeners();
        return;
      },
      (r) {
        if (r.data != null && r.data!.isNotEmpty) {
          listCategoryProduct = r.data!
              .map(
                (e) => CategoryProductModel(
                  category: e,
                  products: [],
                ),
              )
              .toList();
          _state = const ListProductViewState.getCategorySuccess();
        }
        notifyListeners();
      },
    );
  }

  Future<void> fetchAllProductsByCategories() async {
    try {
      _state = const ListProductViewState.loadingGetProductByCategory();
      List<Future<void>> futures = listCategoryProduct.map((item) {
        return getProductByCategory(
          item.category.id ?? 0,
        );
      }).toList();

      await Future.wait(futures);
      _state = const ListProductViewState.getProductByCategorySuccess();
      notifyListeners();
    } catch (e) {
      _state = ListProductViewState.error("Failed to fetch products: $e");
    }
  }

  Future<void> getProductByCategory(int categoryId) async {
    final result = await _productCategoryRepositories.getProduct(
      request: GetProductRequest(
        page: 0,
        pageSize: 4,
        tenantId: AppInformation().tenantId ?? 0,
        orgId: AppInformation().orgId ?? 0,
        posTerminalId: AppInformation().posTerminalId ?? 0,
        productCategoryId: categoryId,
      ),
    );

    result.fold(
      (l) {
        _state = ListProductViewState.error(l.message);
        notifyListeners();
        return;
      },
      (r) {
        List<ProductModel> listProduct = r.data;

        if (listProduct.isNotEmpty) {
          listCategoryProduct = listCategoryProduct.map((item) {
            if (item.category.id == categoryId) {
              return CategoryProductModel(
                category: item.category,
                products: r.currentPage == 0
                    ? listProduct
                    : [...item.products, ...listProduct],
                productPage: r.currentPage,
                productTotalPage: r.totalPages,
              );
            }
            return item;
          }).toList();

          notifyListeners();
        }
      },
    );
  }

  Future<void> getMoreProductByCategory(int categoryId, int page) async {
    _state = const ListProductViewState.loadingGetMoreProductByCategory();
    listCategoryProduct = _changeLoadingGetMoreProduct(categoryId, true);
    notifyListeners();
    final result = await _productCategoryRepositories.getProduct(
      request: GetProductRequest(
        page: page,
        pageSize: 4,
        tenantId: AppInformation().tenantId ?? 0,
        orgId: AppInformation().orgId ?? 0,
        posTerminalId: AppInformation().posTerminalId ?? 0,
        productCategoryId: categoryId,
      ),
    );

    result.fold(
      (l) {
        _state = ListProductViewState.error(l.message);
        listCategoryProduct = _changeLoadingGetMoreProduct(categoryId, false);
        notifyListeners();
        return;
      },
      (r) {
        List<ProductModel> listProduct = r.data;

        if (listProduct.isNotEmpty) {
          listCategoryProduct = listCategoryProduct.map((item) {
            if (item.category.id == categoryId) {
              return CategoryProductModel(
                category: item.category,
                products: r.currentPage == 0
                    ? listProduct
                    : [...item.products, ...listProduct],
                productPage: r.currentPage,
                loadingGetMoreProduct: false,
                productTotalPage: r.totalPages,
              );
            }
            return item;
          }).toList();
          _state = const ListProductViewState.getMoreProductByCategorySuccess();
          notifyListeners();
        }
      },
    );
  }

  List<CategoryProductModel> _changeLoadingGetMoreProduct(
    int categoryId,
    bool isLoading,
  ) {
    listCategoryProduct = listCategoryProduct.map((item) {
      if (item.category.id == categoryId) {
        return item.copyWith(
          loadingGetMoreProduct: isLoading,
        );
      }
      return item;
    }).toList();

    return listCategoryProduct;
  }
}
