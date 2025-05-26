import 'package:emenu/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

extension AppCoordinator<T> on BuildContext {
  void showTopSnackbar(String message, {bool isError = false}) {
    Flushbar(
      messageText: Text(
        message,
        style:
            Theme.of(this).textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      animationDuration: const Duration(milliseconds: 300),
    ).show(this);
  }
}
