import 'package:flutter/material.dart';

extension StringExtension on String? {
  /// Kiểm tra xem chuỗi có phải là null hoặc rỗng hay không.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Kiểm tra xem chuỗi có phải là null, rỗng hoặc chỉ chứa khoảng trắng hay không.
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  /// Trả về chuỗi gốc nếu không phải là null, ngược lại trả về chuỗi rỗng.
  String get orEmpty => this ?? '';

  Color get convertRequestOrderStatusToColor => switch (this) {
        "CNF" => Colors.green,
        "VOID" => Colors.red,
        "PND" => Colors.orange,
        _ => Colors.green
      };
}
