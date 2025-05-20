import 'package:emenu/mvvm/data/model/category_model.dart';
import 'package:emenu/mvvm/data/model/category_product_model.dart';
import 'package:emenu/mvvm/data/model/product_model.dart';

final List<CategoryModel> dummyCateList = [
  CategoryModel(
    id: 1,
    name: 'Category 1',
  ),
  CategoryModel(
    id: 2,
    name: 'Category 2',
  ),
  CategoryModel(
    id: 3,
    name: 'Category 3',
  ),
  CategoryModel(
    id: 4,
    name: 'Category 4',
  ),
  CategoryModel(
    id: 5,
    name: 'Category 5',
  ),
];

final List<CategoryProductModel> dummyCateProductList = [
  CategoryProductModel(
    category: dummyCateList[0],
    products: [
      ProductModel(
        productId: 1,
        name: 'Product 1',
        salesPrice: 10000,
      ),
      ProductModel(
        productId: 2,
        name: 'Product 2',
        salesPrice: 20000,
      ),
    ],
  ),
  CategoryProductModel(
    category: dummyCateList[1],
    products: [
      ProductModel(
        productId: 3,
        name: 'Product 3',
        salesPrice: 30000,
      ),
      ProductModel(
        productId: 4,
        name: 'Product 4',
        salesPrice: 40000,
      ),
      ProductModel(
        productId: 5,
        name: 'Product 5',
        salesPrice: 50000,
      ),
    ],
  ),
  CategoryProductModel(
    category: dummyCateList[2],
    products: [
      ProductModel(
        productId: 6,
        name: 'Product 6',
        salesPrice: 60000,
      ),
      ProductModel(
        productId: 7,
        name: 'Product 7',
        salesPrice: 70000,
      ),
      ProductModel(
        productId: 8,
        name: 'Product 8',
        salesPrice: 80000,
      ),
      ProductModel(
        productId: 9,
        name: 'Product 9',
        salesPrice: 90000,
      ),
    ],
  ),
  CategoryProductModel(category: dummyCateList[3], products: [
    ProductModel(
      productId: 10,
      name: 'Product 10',
      salesPrice: 100000,
    ),
    ProductModel(
      productId: 11,
      name: 'Product 11',
      salesPrice: 110000,
    ),
    ProductModel(
      productId: 12,
      name: 'Product 12',
      salesPrice: 120000,
    ),
    ProductModel(
      productId: 13,
      name: 'Product 13',
      salesPrice: 130000,
    ),
  ])
];
