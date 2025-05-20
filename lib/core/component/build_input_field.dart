import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/material.dart';

class BuilTextdInputField extends StatelessWidget {
  const BuilTextdInputField({
    super.key,
    required this.label,
    this.hint,
    this.width,
    this.margin,
    this.isRequired = false,
    this.controller,
  });

  final double? width;
  final EdgeInsetsGeometry? margin;
  final String label;
  final String? hint;
  final bool isRequired;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: context.titleSmall
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              if (isRequired)
                Text(
                  ' *',
                  style: context.titleSmall.copyWith(
                      color: ThemeConfig.redColor, fontWeight: FontWeight.bold),
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            validator: (value) {
              if ((value == null || value.isEmpty) && isRequired) {
                return 'Vui lòng nhập $label';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: context.titleSmall.copyWith(
                color: Theme.of(context).hintColor,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
