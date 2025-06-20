import 'package:flutter/material.dart';

class BuildScaffoldFooter extends StatelessWidget {
  const BuildScaffoldFooter({
    super.key,
    this.padding,
    required this.child,
    this.height,
  });

  final EdgeInsetsGeometry? padding;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(240, 245, 250, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: child,
    );
  }
}
