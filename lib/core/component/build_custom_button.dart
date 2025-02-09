import 'package:flutter/material.dart';

class BuildCustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;

  const BuildCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Theme.of(context).primaryColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: color ?? Theme.of(context).primaryColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 10),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
