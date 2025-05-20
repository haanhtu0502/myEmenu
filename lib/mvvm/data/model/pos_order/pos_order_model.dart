class PosOrderModel {
  int? id;
  int? customerId;
  String? phone;
  String? customerName;

  PosOrderModel({
    this.id,
    this.customerId,
    this.phone,
    this.customerName,
  });

  factory PosOrderModel.fromJson(Map<String, dynamic> json) {
    return PosOrderModel(
      id: json['id'] as int?,
      customerId: json['customerId'] as int?,
      phone: json['phone'] as String?,
      customerName: json['customerName'] as String?,
    );
  }
}
