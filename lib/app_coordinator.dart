import 'package:emenu/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

extension AppCoordinator<T> on BuildContext {
  void showSnackbar(String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: titleMedium,
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(top: 30, left: 16, right: 16),
      backgroundColor: isError ? Colors.red : Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
