import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';

class CategoryProductModel {
  final CategoryModel category;
  final List<ProductModel> products;
  final int productPage;
  final int productTotalPage;
  bool loadingGetMoreProduct;

  CategoryProductModel({
    required this.category,
    required this.products,
    this.productPage = 0,
    this.productTotalPage = 0,
    this.loadingGetMoreProduct = false,
  });

  CategoryProductModel copyWith({
    CategoryModel? category,
    List<ProductModel>? products,
    int? productPage,
    int? productTotalPage,
    bool? loadingGetMoreProduct,
  }) {
    return CategoryProductModel(
      category: category ?? this.category,
      products: products ?? this.products,
      productPage: productPage ?? this.productPage,
      productTotalPage: productTotalPage ?? this.productTotalPage,
      loadingGetMoreProduct:
          loadingGetMoreProduct ?? this.loadingGetMoreProduct,
    );
  }
}
