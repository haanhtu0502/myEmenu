import 'package:flutter/material.dart';

class BuildCustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final double? radius;
  final bool isVertical;
  final double? width;
  final bool textBold;
  final Color? borderColor;

  const BuildCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.radius,
    this.isVertical = false,
    this.width,
    this.textBold = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8),
        color: color ?? Theme.of(context).primaryColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
          backgroundColor: color ?? Theme.of(context).primaryColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        ),
        child: !isVertical
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  prefixIcon != null ? prefixIcon! : const SizedBox(),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 16,
                      fontWeight:
                          textBold ? FontWeight.bold : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  suffixIcon != null ? suffixIcon! : const SizedBox(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    const SizedBox(height: 4),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 16,
                      fontWeight:
                          textBold ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    const SizedBox(height: 10),
                    suffixIcon!,
                  ],
                ],
              ),
      ),
    );
  }
}
