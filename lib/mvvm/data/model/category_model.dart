class CategoryModel {
  CategoryModel({
    this.id,
    this.orgId,
    this.pcTerminalAccessId,
    this.name,
    this.productCategoryParentId,
    this.parentName,
    this.isActive,
    this.indexSequence,
    this.posTerminalId,
    this.isSummary,
    this.code,
    this.imageUrl,
    this.fromPrice,
  });

  int? id;

  int? orgId;

  int? pcTerminalAccessId;

  String? name;

  int? productCategoryParentId;

  String? parentName;

  String? isActive;

  int? indexSequence;

  int? posTerminalId;

  String? isSummary;

  String? code;

  String? imageUrl;

  num? fromPrice;

  CategoryModel copyWith({
    int? id,
    int? orgId,
    int? pcTerminalAccessId,
    String? name,
    int? productCategoryParentId,
    String? parentName,
    String? isActive,
    int? indexSequence,
    int? posTerminalId,
    String? isSummary,
    String? code,
    String? imageUrl,
    num? fromPrice,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      orgId: orgId ?? this.orgId,
      pcTerminalAccessId: pcTerminalAccessId ?? this.pcTerminalAccessId,
      name: name ?? this.name,
      productCategoryParentId:
          productCategoryParentId ?? this.productCategoryParentId,
      parentName: parentName ?? this.parentName,
      isActive: isActive ?? this.isActive,
      indexSequence: indexSequence ?? this.indexSequence,
      posTerminalId: posTerminalId ?? this.posTerminalId,
      isSummary: isSummary ?? this.isSummary,
      code: code ?? this.code,
      imageUrl: imageUrl ?? this.imageUrl,
      fromPrice: fromPrice ?? this.fromPrice,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int?,
      orgId: json['orgId'] as int?,
      pcTerminalAccessId: json['pcTerminalAccessId'] as int?,
      name: json['name'] as String?,
      productCategoryParentId: json['productCategoryParentId'] as int?,
      parentName: json['parentName'] as String?,
      isActive: json['isActive'] as String?,
      indexSequence: json['indexSequence'] as int?,
      posTerminalId: json['posTerminalId'] as int?,
      isSummary: json['isSummary'] as String?,
      code: json['code'] as String?,
      imageUrl: json['imageUrl'] as String?,
      fromPrice: json['fromPrice'] as num?,
    );
  }
}
