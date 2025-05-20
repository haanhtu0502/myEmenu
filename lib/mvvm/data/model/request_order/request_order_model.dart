import 'package:emenu/mvvm/data/model/customer/customer_model.dart';
import 'package:emenu/mvvm/data/model/floor/floor_model.dart';
import 'package:emenu/mvvm/data/model/table/table_model.dart';

class RequestOrderModel {
  int? id;
  String? isActive;
  CustomerModel? customer;
  TableModel? table;
  FloorModel? floor;
  String? orderStatus;

  RequestOrderModel({
    this.id,
    this.isActive,
    this.customer,
    this.table,
    this.floor,
    this.orderStatus,
  });

  factory RequestOrderModel.fromJson(Map<String, dynamic> json) =>
      RequestOrderModel(
        id: json['id'] as int?,
        isActive: json['isActive'] as String?,
        customer: json['customer'] == null
            ? null
            : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
        table: json['table'] == null
            ? null
            : TableModel.fromJson(json['table'] as Map<String, dynamic>),
        floor: json['floor'] == null
            ? null
            : FloorModel.fromJson(json['floor'] as Map<String, dynamic>),
        orderStatus: json['orderStatus'] as String?,
      );
}
