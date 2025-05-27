import 'package:emenu/core/component/image_render.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCardItem extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final Widget content;
  final bool isBorder;
  final double imageTopPosition;
  final BoxFit imageFit;

  const ProductCardItem({
    super.key,
    required this.imageUrl,
    this.width,
    required this.content,
    this.isBorder = false,
    this.imageTopPosition = -40,
    this.imageFit = BoxFit.cover,
  });

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  final ValueNotifier<double> _imageTopPosition = ValueNotifier<double>(-40);

  @override
  void initState() {
    _imageTopPosition.value = widget.imageTopPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _imageTopPosition.value = _imageTopPosition.value - 5,
      onExit: (event) => _imageTopPosition.value = widget.imageTopPosition + 5,
      cursor: MaterialStateMouseCursor.clickable,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // tạo chiều sâu 3D
              ..rotateX(-0.2), // xoay nhẹ ra sau (âm là nghiêng về sau)
            alignment: FractionalOffset.topCenter,
            child: Container(
              width: widget.width ?? double.infinity,
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 12,
                left: 12,
                right: 12,
              ),
              decoration: widget.isBorder
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color.fromRGBO(211, 216, 226, 1),
                        width: 1,
                      ),
                      boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(
                                150, 150, 154, 0.15), // rgba(150,150,154,0.15)
                            offset: Offset(12, 12), // tương đương 12px 12px
                            blurRadius: 30, // tương đương 30px
                            spreadRadius: 0, // tương đương 0px
                          ),
                        ])
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
          ),
          ValueListenableBuilder(
            valueListenable: _imageTopPosition,
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: _imageTopPosition.value,
                child: ImageRender(
                  fit: widget.imageFit,
                  imageUrl: widget.imageUrl,
                  height: 85,
                  width: widget.width != null ? (widget.width! - 34) : 80,
                  radius: 15,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
