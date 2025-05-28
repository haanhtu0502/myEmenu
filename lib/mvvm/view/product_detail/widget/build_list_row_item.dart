import 'dart:math';

import 'package:flutter/material.dart';

class BuildListRowItem<T> extends StatelessWidget {
  const BuildListRowItem({
    super.key,
    required this.itemBuilder,
    required this.items,
    this.height,
    this.itemGap,
    this.emptyMessage = 'No items available',
  });

  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final double? height;
  final double? itemGap;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: height ?? double.minPositive,
      child: Column(
        children: [
          ...items
              .map(
                (item) => itemBuilder(item),
              )
              .expand(
                (element) => [
                  element,
                  SizedBox(height: itemGap ?? 16),
                ],
              ),
          if (items.isEmpty)
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  emptyMessage,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
