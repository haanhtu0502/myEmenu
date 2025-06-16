import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:emenu/mvvm/data/model/request_history/request_history_line_model.dart';

class RequestHistoryModel {
  final int? id;
  final int? orgId;
  final int? tenantId;
  final int? qty;
  final String? status;
  final String? valueStatus;
  final String? description;
  final int? productId;
  final int? posOrderId;
  final int? taxId;
  final num? extraAmount;
  final int? kitchenOrderLineId;
  final int? posOrderLineId;
  final int? requestOrderLineId;
  final num? salesPrice;
  final num? discountPercent;
  final num? priceDiscount;
  final num? discountAmount;
  final num? lineNetAmt;
  final num? taxAmount;
  final num? grandTotal;
  final String? timeWaiting;
  final int? taxRate;
  final String? taxName;
  final ProductModel? product;
  final String? isActive;
  final List<RequestHistoryLineModel>? lineDetails;
  final String? created;

  RequestHistoryModel({
    this.id,
    this.orgId,
    this.tenantId,
    this.qty,
    this.status,
    this.valueStatus,
    this.description,
    this.productId,
    this.posOrderId,
    this.taxId,
    this.extraAmount,
    this.kitchenOrderLineId,
    this.posOrderLineId,
    this.requestOrderLineId,
    this.salesPrice,
    this.discountPercent,
    this.priceDiscount,
    this.discountAmount,
    this.lineNetAmt,
    this.taxAmount,
    this.grandTotal,
    this.timeWaiting,
    this.taxRate,
    this.taxName,
    this.product,
    this.isActive,
    this.lineDetails,
    this.created,
  });

  factory RequestHistoryModel.fromJson(Map<String, dynamic> json) {
    return RequestHistoryModel(
      id: json['id'] as int?,
      orgId: json['orgId'] as int?,
      tenantId: json['tenantId'] as int?,
      qty: json['qty'] as int?,
      status: json['status'] as String?,
      valueStatus: json['valueStatus'] as String?,
      description: json['description'] as String?,
      productId: json['productId'] as int?,
      posOrderId: json['posOrderId'] as int?,
      taxId: json['taxId'] as int?,
      extraAmount: (json['extraAmount'] as num?)?.toDouble(),
      kitchenOrderLineId: json['kitchenOrderLineId'] as int?,
      posOrderLineId: json['posOrderLineId'] as int?,
      requestOrderLineId: json['requestOrderLineId'] as int?,
      salesPrice: (json['salesPrice'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
      priceDiscount: (json['priceDiscount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      lineNetAmt: (json['lineNetAmt'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
      timeWaiting: json['timeWaiting'] as String?,
      taxRate: json['taxRate'] as int?,
      taxName: json['taxName'] as String?,
      product: json['productDto'] == null
          ? null
          : ProductModel.fromJson(json['productDto']),
      isActive: json['isActive'] as String?,
      lineDetails: (json['lineDetails'] as List<dynamic>?)
          ?.map((e) => RequestHistoryLineModel.fromJson(e))
          .toList(),
      created: json['created'] as String?,
    );
  }
}
