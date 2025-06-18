import 'package:emenu/mvvm/data/model/uom/uom_model.dart';

class RequestHistoryLineModel {
  final int? id;
  final int? orgId;
  final String? productName;
  final UOMModel? uom;
  final num? qty;
  final String? description;
  final num? saleprice;
  final num? totalAmount;
  final int? taxId;
  final String? taxName;
  final int? taxRate;

  RequestHistoryLineModel({
    this.id,
    this.orgId,
    this.productName,
    this.uom,
    this.qty,
    this.description,
    this.saleprice,
    this.totalAmount,
    this.taxId,
    this.taxName,
    this.taxRate,
  });

  factory RequestHistoryLineModel.fromJson(Map<String, dynamic> json) {
    return RequestHistoryLineModel(
      id: json['id'] as int?,
      orgId: json['orgId'] as int?,
      productName: json['productName'] as String?,
      uom: json['uom'] != null
          ? UOMModel.fromJson(json['uom'] as Map<String, dynamic>)
          : null,
      qty: json['qty'] as num?,
      description: json['description'] as String?,
      saleprice: json['saleprice'] as num?,
      totalAmount: json['totalAmount'] as num?,
      taxId: json['taxId'] as int?,
      taxName: json['taxName'] as String?,
      taxRate: json['taxRate'] as int?,
    );
  }
}
