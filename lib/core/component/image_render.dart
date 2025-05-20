import 'package:flutter/material.dart';

class ImageRender extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  final double radius;
  const ImageRender({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.radius = 12.0,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: buildImage(context),
    );
  }

  Widget buildImage(BuildContext context) {
    if (imageUrl.toLowerCase().contains("assets/images")) {
      return Image.asset(
        imageUrl,
        fit: fit,
        width: width,
        height: height,
      );
    }
    return Image.network(
      imageUrl,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
