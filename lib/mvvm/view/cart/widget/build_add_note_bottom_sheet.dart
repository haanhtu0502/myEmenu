import 'dart:ui';

import 'package:emenu/core/component/build_custom_button.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/generated/l10n.dart';
import 'package:flutter/material.dart';

class BuildAddNoteBottomSheet extends StatefulWidget {
  const BuildAddNoteBottomSheet({
    super.key,
    this.note,
  });

  final String? note;

  @override
  State<BuildAddNoteBottomSheet> createState() =>
      _BuildAddNoteBottomSheetState();
}

class _BuildAddNoteBottomSheetState extends State<BuildAddNoteBottomSheet> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    _noteController.text = widget.note ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).note,
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _noteController,
            onChanged: (value) {
              _noteController.text = value;
            },
            maxLines: 5,
            selectionHeightStyle: BoxHeightStyle.max,
            // minLines: 1,r
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: S.of(context).inputNote,
              hintStyle: context.titleMedium.copyWith(
                color: Theme.of(context).hintColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(
                    211,
                    216,
                    226,
                    1,
                  ),
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(
                    211,
                    216,
                    226,
                    1,
                  ),
                  width: 1,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: BuildCustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: S.of(context).back,
                  color: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: BuildCustomButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      _noteController.text,
                    );
                  },
                  text: S.of(context).addNote,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
