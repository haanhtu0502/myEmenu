class CreateOrderRequest {
  CreateOrderRequest({
    this.isActive = 'Y',
    required this.orgId,
    this.orderStatus = 'PND',
    required this.priceListId,
    required this.cusName,
    required this.cusPhone,
    required this.orderTime,
    required this.floorId,
    required this.tableId,
    required this.requestOrderLineDto,
    required this.posTerminalId,
  });

  String isActive;
  int orgId;
  int priceListId;
  String orderStatus;
  String cusName;
  String cusPhone;
  int floorId;
  int tableId;
  int posTerminalId;
  String orderTime;
  List<OrderLine>? requestOrderLineDto;

  Map<String, dynamic> toJson() => {
        'isActive': isActive,
        'orgId': orgId,
        'orderStatus': orderStatus,
        'cusName': cusName,
        'cusPhone': cusPhone,
        'orderTime': orderTime,
        'floorId': floorId,
        'priceListId': priceListId,
        'tableId': tableId,
        'posTerminalId': posTerminalId,
        'requestOrderLineDto':
            requestOrderLineDto!.map((e) => e.toJson()).toList(),
      };
}

class OrderLine {
  OrderLine({
    required this.orgId,
    required this.productId,
    required this.qty,
    required this.salePrice,
    required this.totalAmount,
    this.taxId,
    this.description,
    this.isActive = 'Y',
    this.lineDetail,
  });
  String isActive = 'Y';
  int orgId;
  int productId;
  int qty;
  String? description;
  double salePrice;
  double totalAmount;
  int? taxId;
  List<LineDetailModel>? lineDetail;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'isActive': isActive,
      'orgId': orgId,
      'productId': productId,
      'qty': qty,
      'saleprice': salePrice,
      'totalAmount': totalAmount,
      'description': description,
      'lineDetail': lineDetail?.map((e) => e.toJson()).toList(),
    };
    if (taxId != null) {
      data['taxId'] = taxId;
    }

    return data;
  }
}

class LineDetailModel {
  String? isActive;
  int? orgId;
  int? productId;
  num? qty;
  double? salePrice;
  double? totalAmount;
  int? taxId;
  String? description;

  LineDetailModel({
    this.isActive,
    this.orgId,
    this.productId,
    this.qty,
    this.salePrice,
    this.totalAmount,
    this.taxId,
    this.description,
  });

  LineDetailModel.fromJson(Map<String, dynamic> json) {
    isActive = json['isActive'];
    orgId = json['orgId'];
    productId = json['productId'];
    qty = json['qty'];
    salePrice = json['saleprice']?.toDouble();
    totalAmount = json['totalAmount']?.toDouble();
    taxId = json['taxId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'isActive': isActive,
      'orgId': orgId,
      'productId': productId,
      'qty': qty,
      'saleprice': salePrice,
      'totalAmount': totalAmount,
      'taxId': taxId,
      'description': description,
    };
  }
}
