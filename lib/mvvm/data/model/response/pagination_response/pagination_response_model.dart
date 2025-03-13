import 'package:json_annotation/json_annotation.dart';

part 'pagination_response_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class PaginationResponse<T> {
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "errors")
  String? errors;

  @JsonKey(name: "totalPages")
  final int totalPages;

  @JsonKey(name: "currentPage")
  final int currentPage;

  @JsonKey(name: "pageSize")
  int? pageSize;

  @JsonKey(name: "totalItems")
  int? totalItems;

  @JsonKey(name: "data")
  final List<T> data;

  PaginationResponse({
    this.pageSize,
    required this.totalPages,
    required this.currentPage,
    required this.data,
    required this.status,
    required this.message,
    required this.totalItems,
    required this.errors,
  });

  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginationResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginationResponseToJson(this, toJsonT);
}
