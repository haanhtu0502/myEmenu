import 'package:emenu/mvvm/data/model/image/image_model.dart';

class OrgEmenuModel {
  final int? id;
  final String? code;
  final String? name;
  final String? address;
  final String? email;
  final String? area;
  final String? wards;
  final int? erpOrgId;
  final String? description;
  final String? isSummary;
  final String? phone;
  final String? taxCode;
  final String? isActive;
  final String? url;
  final int? priceListId;
  final String? isPosMng;
  final String? exDate;
  final String? userId;
  final String? role;
  final List<ImageModel>? imageEmenu;
  final String? urlEmenu;

  OrgEmenuModel({
    this.id,
    this.code,
    this.name,
    this.address,
    this.email,
    this.area,
    this.wards,
    this.erpOrgId,
    this.description,
    this.isSummary,
    this.phone,
    this.taxCode,
    this.isActive,
    this.url,
    this.priceListId,
    this.isPosMng,
    this.exDate,
    this.userId,
    this.role,
    this.imageEmenu,
    this.urlEmenu,
  });

  factory OrgEmenuModel.fromJson(Map<String, dynamic> json) {
    return OrgEmenuModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      area: json['area'] as String?,
      wards: json['wards'] as String?,
      erpOrgId: json['erpOrgId'] as int?,
      description: json['description'] as String?,
      isSummary: json['isSummary'] as String?,
      phone: json['phone'] as String?,
      taxCode: json['taxCode'] as String?,
      isActive: json['isActive'] as String?,
      url: json['url'] as String?,
      priceListId: json['priceListId'] as int?,
      isPosMng: json['isPosMng'] as String?,
      exDate: json['exDate'] as String?,
      userId: json['userId'] as String?,
      role: json['role'] as String?,
      imageEmenu: (json['imageEmenu'] as List?)
          ?.map((e) => ImageModel.fromJson(e))
          .toList(),
      urlEmenu: json['urlEmenu'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'address': address,
      'email': email,
      'area': area,
      'wards': wards,
      'erpOrgId': erpOrgId,
      'description': description,
      'isSummary': isSummary,
      'phone': phone,
      'taxCode': taxCode,
      'isActive': isActive,
      'url': url,
      'priceListId': priceListId,
      'isPosMng': isPosMng,
      'exDate': exDate,
      'userId': userId,
      'role': role,
      'imageEmenu': imageEmenu?.map((e) => e.toJson()).toList(),
      'urlEmenu': urlEmenu,
    };
  }
}
