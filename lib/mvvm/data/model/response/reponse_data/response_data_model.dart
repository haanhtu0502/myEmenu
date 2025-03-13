import 'package:json_annotation/json_annotation.dart';

part 'response_data_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ResponseData<T> {
  @JsonKey(name: "status")
  final int? status;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  final T? data;

  @JsonKey(name: "errors")
  final String? errors;

  ResponseData({
    this.status,
    this.data,
    this.errors,
    required this.message,
  });

  factory ResponseData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResponseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseDataToJson(this, toJsonT);
}
