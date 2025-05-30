import 'package:emenu/mvvm/view/cart/widget/build_add_note_bottom_sheet.dart';
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
}
