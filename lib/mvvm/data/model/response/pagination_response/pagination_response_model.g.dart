// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponse<T>(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalItems: (json['totalItems'] as num?)?.toInt(),
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$PaginationResponseToJson<T>(
  PaginationResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
      'data': instance.data.map(toJsonT).toList(),
    };
