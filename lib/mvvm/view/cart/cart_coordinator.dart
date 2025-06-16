import 'package:emenu/mvvm/view/cart/widget/build_add_note_bottom_sheet.dart';
import 'package:emenu/mvvm/view/cart/widget/build_send_request_success_dialog.dart';
import 'package:flutter/material.dart';

extension CartCoordinator on BuildContext {
  Future<String?> showAddNoteDialog({String? note}) async {
    final result = await showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BuildAddNoteBottomSheet(
            note: note,
          ),
        );
      },
    );

    if (result is String) {
      return result;
    } else {
      return null;
    }
  }

  Future<void> showSendRequestSuccessDialog() async {
    await showDialog(
      context: this,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: const SendRequestSuccessDialog(),
        );
      },
    );
  }
}
