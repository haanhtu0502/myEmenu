class ImageModel {
  final int? id;
  final String? imageUrl;
  final String? imageCode;
  final String? image64;
  final String? tenantCode;
  final String? isActive;
  final String? industryCode;

  ImageModel({
    this.id,
    this.imageUrl,
    this.imageCode,
    this.image64,
    this.tenantCode,
    this.isActive,
    this.industryCode,
  });
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String?,
      imageCode: json['imageCode'] as String?,
      image64: json['image64'] as String?,
      tenantCode: json['tenantCode'] as String?,
      isActive: json['isActive'] as String?,
      industryCode: json['industryCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'imageCode': imageCode,
      'image64': image64,
      'tenantCode': tenantCode,
      'isActive': isActive,
      'industryCode': industryCode,
    };
  }
}
