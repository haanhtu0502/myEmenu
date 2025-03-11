import 'package:flutter/material.dart';

class BuildListRowItem<T> extends StatelessWidget {
  const BuildListRowItem({
    super.key,
    required this.itemBuilder,
    required this.items,
    this.height,
    this.itemGap,
  });

  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final double? height;
  final double? itemGap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 300,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return itemBuilder(items[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: itemGap ?? 16);
              },
            ),
          ),
        ],
      ),
    );
  }
}
