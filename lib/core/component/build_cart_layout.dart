import 'package:emenu/core/component/dragable_cart.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:emenu/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class BuildCartLayout extends StatefulWidget {
  const BuildCartLayout({super.key, required this.child});

  final Widget child;

  @override
  State<BuildCartLayout> createState() => _BuildCartLayoutState();
}

class _BuildCartLayoutState extends State<BuildCartLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          DragableCart(
            screenHeight: context.heightDevice,
            screenWidth: context.widthDevice,
          )
        ],
      ),
    );
  }
}
