import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/mvvm/data/model/category_product_model.dart';
import 'package:flutter/material.dart';

class BuildCateListProduct extends StatefulWidget {
  const BuildCateListProduct({super.key, required this.item});

  final CategoryProductModel item;

  @override
  State<BuildCateListProduct> createState() => _BuildCateListProductState();
}

class _BuildCateListProductState extends State<BuildCateListProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(children: [
          Text(
            widget.item.category.name ?? '',
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        const SizedBox(height: 50),
      ],
    );
  }
}
