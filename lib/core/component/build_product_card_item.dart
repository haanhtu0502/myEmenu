import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCardItem extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final Widget content;
  final bool isBorder;

  const ProductCardItem({
    super.key,
    required this.imageUrl,
    this.width,
    required this.content,
    this.isBorder = false,
  });

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  final ValueNotifier<double> _imageTopPosition = ValueNotifier<double>(-40);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _imageTopPosition.value = -45,
      onExit: (event) => _imageTopPosition.value = -40,
      cursor: MaterialStateMouseCursor.clickable,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: widget.width ?? double.infinity,
            padding: const EdgeInsets.only(
              top: 70,
              bottom: 12,
              left: 12,
              right: 12,
            ),
            decoration: widget.isBorder
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color.fromRGBO(211, 216, 226, 1),
                      width: 1,
                    ),
                  )
                : BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
            child: widget.content,
          ),
          ValueListenableBuilder(
            valueListenable: _imageTopPosition,
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: _imageTopPosition.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.imageUrl,
                    width: widget.width != null ? (widget.width! - 34) : 80,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
