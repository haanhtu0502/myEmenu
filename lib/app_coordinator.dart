import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:emenu/core/component/image_render.dart';
import 'package:emenu/core/design_system/resource/image_const.dart';
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
      duration: const Duration(seconds: 1),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            width: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () => Navigator.of(context).pop(),
                      color: Theme.of(context).dividerColor,
                    ),
                  ],
                ),
                ImageRender(
                  imageUrl: ImageConst.deleteIcon,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        confirmText ?? S.of(context).sendRequestSuccess,
                        textAlign: TextAlign.center,
                        style: context.titleMedium,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    onConfirm();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).confirm,
                          style: context.titleMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
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
