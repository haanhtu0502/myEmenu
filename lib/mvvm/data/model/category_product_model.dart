import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';

class CategoryProductModel {
  final CategoryModel category;
  final List<ProductModel> products;

  CategoryProductModel({
    required this.category,
    required this.products,
  });

  CategoryProductModel copyWith({
    CategoryModel? category,
    List<ProductModel>? products,
  }) {
    return CategoryProductModel(
      category: category ?? this.category,
      products: products ?? this.products,
    );
  }
}
