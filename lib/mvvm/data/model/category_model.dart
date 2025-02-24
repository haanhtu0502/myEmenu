class CategoryModel {
  CategoryModel({
    this.id,
    this.uid,
    this.name,
    this.code,
    this.isActive,
    this.isMenu,
    this.productCategoryParent,
    this.qtyProduct,
    this.isSummary,
  });

  int? id;

  String? uid;

  String? name;

  String? code;

  String? isActive;

  String? isMenu;

  CategoryModel? productCategoryParent;

  num? qtyProduct;

  String? isSummary;
}
