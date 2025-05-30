import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/generated/l10n.dart';
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
      animationDuration: const Duration(milliseconds: 200),
    ).show(this);
  }

  Future<void> showAlertDialog({
    required Widget content,
    Color? backgroundColor,
    bool barrierDismissible = true,
    double? width,
    double? height,
  }) async {
    await showDialog(
      context: this,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          backgroundColor:
              backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: content,
          ),
        );
      },
    );
  }

  Future<bool> showConfirmDialog({
    String? title,
    String? confirmText,
    Color? backgroundColor,
    bool barrierDismissible = true,
    double? width,
    double? height,
    required VoidCallback onConfirm,
  }) async {
    final result = await showDialog(
      context: this,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          backgroundColor:
              backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      title ?? 'Confirm',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        confirmText ?? 'Are you sure you want to proceed?',
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: BuildCustomButton(
                        width: 120,
                        text: S.of(context).close,
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        color: Colors.white,
                        textColor: Theme.of(context).primaryColor,
                        borderColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: BuildCustomButton(
                        width: 120,
                        text: S.of(context).confirm,
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          onConfirm();
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return result ?? false;
  }
}
