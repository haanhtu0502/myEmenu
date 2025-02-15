import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final double? width;
  final Widget content;

  const ProductCardItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.width,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center, // Căn giữa tất cả phần tử trong Stack
      children: [
        Container(
          width: width ?? double.infinity,
          padding:
              const EdgeInsets.only(top: 70, bottom: 12, left: 12, right: 12),
          decoration: BoxDecoration(
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
          child: content,
        ),

        // Hình ảnh sản phẩm nằm giữa
        Positioned(
          top: -40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              width: width != null ? (width! - 34) : 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
